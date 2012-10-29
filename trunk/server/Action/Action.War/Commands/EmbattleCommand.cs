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
using Action.DataAccess;
using System.ComponentModel.Composition;

namespace Action.Login.Commands
{
    [GameCommand((int)CommandEnum.Embattle)]
    public class EmbattleCommand : GameCommand
    {
        [Import]
        private MongoDataAccess mongoDB = null;
        
        protected override bool Ready(GameSession session)
        {
            return true;
        }

        protected override void Run(GameSession session)
        {
            //if (args.Account != null && args.Account.Trim().ToLower().StartsWith("test"))
            //{
            //    session.EnterLogin(args.Account);
            //    var allPlayers = mongoDB.DefaultDatabase
            //        .GetCollection<Player>().AsQueryable();
            //    var player = allPlayers.Where(p => p.Account == args.Account).FirstOrDefault();
            //    if (player != null)
            //        LoginHelper.EnterGame(session, player);
            //    else
            //        session.SendResponse(ID, (int)S2C.RoleMissing);
            //}
            //else
            //    session.SendResponse(ID, (int)S2C.ErrorAccount);
        }

    }
}
