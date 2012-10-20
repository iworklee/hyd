using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;
using Action.Model;
using Action.Core;
using MongoDB.Driver.Linq;

namespace Action.Test.Commands
{
    [GameCommand(983)]
    public class TestQueryMongoDBCommand : GameCommand<string>
    {
        protected override bool Ready(GameSession session, string args)
        {
            return true;
        }

        protected override void Run(GameSession session, string args)
        {
            var db = session.AppServer.DefaultDatabase;
            var player = db.GetCollection<Player>().AsQueryable().Single(p => p.Name == args);
            session.SendResponse(983, player.Account);
        }
    }
}
