using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;

namespace Action.Test.Commands
{
    [GameCommand(982)]
    public class TestStringCommand : GameCommand<string>
    {
        protected override bool Ready(GameSession session, string args)
        {
            return true;
        }

        protected override void Run(GameSession session, string args)
        {
            session.SendResponse(982, args);
        }
    }
}
