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
using Action.War;

namespace Action.Login.Commands
{
    [GameCommand((int)CommandEnum.MakeWar)]
    public class MakeWarCommand : GameCommand
    {
        [Import]
        private MongoDataAccess mongoDB = null;

        protected override bool Ready(GameSession session)
        {
            return true;
        }

        protected override void Run(GameSession session)
        {
            var combat = new Combat();

            var attacker = new Army();
            attacker.Units.Add(new Unit { ID = 1, Positon = 0 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 1 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 2 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 3 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 4 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 5 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 6 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 7 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 8 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 9 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 10 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 11 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 12 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 13 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 14 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 15 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 16 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 17 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 18 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 19 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 20 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 21 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 22 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 23 });
            attacker.Units.Add(new Unit { ID = 1, Positon = 24 });
            combat.LoadAttacker(attacker);

            var defender = new Army();
            defender.Units.Add(new Unit { ID = 1, Positon = 0 });
            defender.Units.Add(new Unit { ID = 1, Positon = 1 });
            defender.Units.Add(new Unit { ID = 1, Positon = 2 });
            defender.Units.Add(new Unit { ID = 1, Positon = 3 });
            defender.Units.Add(new Unit { ID = 1, Positon = 4 });
            defender.Units.Add(new Unit { ID = 1, Positon = 5 });
            defender.Units.Add(new Unit { ID = 1, Positon = 6 });
            defender.Units.Add(new Unit { ID = 1, Positon = 7 });
            defender.Units.Add(new Unit { ID = 1, Positon = 8 });
            defender.Units.Add(new Unit { ID = 1, Positon = 9 });
            defender.Units.Add(new Unit { ID = 1, Positon = 10 });
            defender.Units.Add(new Unit { ID = 1, Positon = 11 });
            defender.Units.Add(new Unit { ID = 1, Positon = 12 });
            defender.Units.Add(new Unit { ID = 1, Positon = 13 });
            defender.Units.Add(new Unit { ID = 1, Positon = 14 });
            defender.Units.Add(new Unit { ID = 1, Positon = 15 });
            defender.Units.Add(new Unit { ID = 1, Positon = 16 });
            defender.Units.Add(new Unit { ID = 1, Positon = 17 });
            defender.Units.Add(new Unit { ID = 1, Positon = 18 });
            defender.Units.Add(new Unit { ID = 1, Positon = 19 });
            defender.Units.Add(new Unit { ID = 1, Positon = 20 });
            defender.Units.Add(new Unit { ID = 1, Positon = 21 });
            defender.Units.Add(new Unit { ID = 1, Positon = 22 });
            defender.Units.Add(new Unit { ID = 1, Positon = 23 });
            defender.Units.Add(new Unit { ID = 1, Positon = 24 });
            combat.LoadDefender(defender);

            combat.Perform();

            session.SendResponse(ID, combat.Report);
        }

    }
}
