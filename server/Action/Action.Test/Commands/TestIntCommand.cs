using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;

namespace Action.Test.Commands
{
    [GameCommand(981)]
    public class TestIntCommand : GameCommand<int>
    {
        protected override void Run(GameSession session, int args)
        {
            throw new NotImplementedException();
        }
    }
}
