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
        protected override void Run(GameSession session, string args)
        {
        }
    }
}
