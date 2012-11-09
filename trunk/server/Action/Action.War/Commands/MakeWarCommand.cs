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
            combat.LoadAttacker(attacker);

            var defender = new Army();
            combat.LoadDefender(defender);

            combat.Perform();

            session.SendResponse(ID, combat.Report);
        }

    }
}
