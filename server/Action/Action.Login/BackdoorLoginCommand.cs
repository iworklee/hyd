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
using Action.Model.Protobuf;
using Action.Model.Mongodb;

namespace Action.Login
{
    [GameCommand((int)CommandEnum.BackdoorLogin)]
    public class BackdoorLoginCommand : GameCommand<BackdoorLoginArgs>
    {
        enum S2C
        {
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
                session.Login(args.Account);
                var allPlayers = session.AppServer.DefaultDatabase
                    .GetCollection(DbCollectionDef.Player.Name).AsQueryable<Player>();
                var player = allPlayers.Where(p => p.Account == args.Account).FirstOrDefault();
                if (player != null)
                {
                    session.Player.IsOnline = true;
                    session.Player.Name = player.Name;
                    session.Player.Job = player.Job;
                    session.Player.Sex = (int)player.Sex;
                }
                else
                    session.SendResponse(CommandId, (int)S2C.RoleMissing);
            }
            else
                session.Close();
        }
    }
}
