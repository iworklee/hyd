using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Command;
using SuperSocket.Common;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using Action.Engine;
using Action.Model;

namespace Action.Login.Commands
{
    [GameCommand((int)CommandEnum.BackdoorLogin)]
    public class BackdoorLoginCommand : GameCommand<BackdoorLoginArgs>
    {
        enum S2C
        {
            OK,
            RoleMissing = 1
        }

        protected override bool Ready(GameSession session, BackdoorLoginArgs args)
        {
            return true;
        }

        protected override void Run(GameSession session, BackdoorLoginArgs args)
        {
            if (args.Account != null && args.Account.Trim().ToLower().StartsWith("test"))
            {
                session.EnterLogin(args.Account);
                var allPlayers = session.AppServer.DefaultDatabase
                    .GetCollection<Player>(DbCollectionDef.Player.Name).AsQueryable();
                var player = allPlayers.Where(p => p.Account == args.Account).FirstOrDefault();
                if (player != null)
                    LoginHelper.EnterGame(session, player);
                else
                    session.SendResponse(ID, (int)S2C.RoleMissing);
            }
            else
                session.Close();
        }
    }
}
