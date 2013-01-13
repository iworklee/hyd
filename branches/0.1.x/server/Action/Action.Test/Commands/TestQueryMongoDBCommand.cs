using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;
using Action.Model;
using Action.DataAccess;
using MongoDB.Driver.Linq;
using System.ComponentModel.Composition;
using MongoDB.Driver.Builders;

namespace Action.Test.Commands
{
    [GameCommand(983)]
    public class TestQueryMongoDBCommand : GameCommand<string>
    {
        [Import]
        private MongoDataAccess mongoDB = null;

        protected override bool Ready(GameSession session, string args)
        {
            return true;
        }

        protected override void Run(GameSession session, string args)
        {
            var db = mongoDB.DefaultDatabase;
            var player = db.GetCollection<Player>().AsQueryable().Single(p => p.Name == args);
            session.SendResponse(983, player.Account);

            //db.GetCollection<Player>().GeoHaystackSearch(10.0d, 10.0d, GeoHaystackSearchOptions<Player>.Null);
        }
    }
}
