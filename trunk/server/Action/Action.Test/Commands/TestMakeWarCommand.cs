using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Command;
//using SuperSocket.Common;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using Action.Engine;
using Action.Model;
using Action.DataAccess;
using System.ComponentModel.Composition;
using Action.War;
using System.Diagnostics;

namespace Action.Login.Commands
{
    [GameCommand(984)]
    public class TestMakeWarCommand : GameCommand
    {
        [Import]
        private MongoDataAccess mongoDB = null;

        protected override bool Ready(GameSession session)
        {
            return true;
        }

        protected override void Run(GameSession session)
        {
            var rng = new Random(DateTime.Now.Millisecond);

            var db = mongoDB.DefaultDatabase;
            var player1 = db.GetCollection<Player>().AsQueryable().Single(p => p.Name == "test" + rng.Next(0, 1000));
            var player2 = db.GetCollection<Player>().AsQueryable().Single(p => p.Name == "test" + rng.Next(0, 1000));

            var combat = new Combat();

            var attacker = new Army();
            attacker.Units.AddRange(player1.Army.Units.Select(u => new Unit { ID = u.ID, Positon = u.Positon }));
            combat.LoadAttacker(attacker);

            var defender = new Army();
            defender.Units.AddRange(player2.Army.Units.Select(u => new Unit { ID = u.ID, Positon = u.Positon }));
            combat.LoadDefender(defender);

            Debug.Assert(combat.Perform());

            session.SendResponse(ID, combat.Report);
        }

    }
}
