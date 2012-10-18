using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;

namespace Action.Test.Commands
{
    [GameCommand(978)]
    public class TestBoolCommand : GameCommand<bool>
    {
        protected override void Run(GameSession session, bool args)
        {
            
        }
    }
}
