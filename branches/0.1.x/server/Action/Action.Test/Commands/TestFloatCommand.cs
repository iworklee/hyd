using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;

namespace Action.Test.Commands
{
    [GameCommand(980)]
    public class TestFloatCommand : GameCommand<float>
    {
        protected override bool Ready(GameSession session, float args)
        {
            return true;
        }

        protected override void Run(GameSession session, float args)
        {
            session.SendResponse(980, args);
        }
    }
}
