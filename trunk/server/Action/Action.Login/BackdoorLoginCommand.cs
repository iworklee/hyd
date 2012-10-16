using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;

namespace Action.Login
{
    [GameCommand(1000)]
    public class BackdoorLoginCommand : GameCommand<int>
    {
        public override void ExecuteCommand(GameSession session, int data)
        {
            throw new NotImplementedException();
        }
    }
}
