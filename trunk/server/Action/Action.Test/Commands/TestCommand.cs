﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;

namespace Action.Test.Commands
{
    [GameCommand(979)]
    public class TestCommand : GameCommand
    {
        protected override bool Ready(GameSession session)
        {
            return true;
        }

        protected override void Run(GameSession session)
        {
            Console.WriteLine(this.ToString());
        }
    }
}
