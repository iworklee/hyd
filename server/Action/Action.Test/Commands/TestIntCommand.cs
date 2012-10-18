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
        protected override bool Ready(GameSession session, int args)
        {
            return true;
        }

        protected override void Run(GameSession session, int args)
        {
            Console.WriteLine("{0} - {1}", this.ToString(), args);
        }
    }
}
