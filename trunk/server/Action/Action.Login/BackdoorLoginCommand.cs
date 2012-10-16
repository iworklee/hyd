using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;
using SuperSocket.SocketBase.Command;

namespace Action.Login
{
    [GameCommand(1000)]
    public class BackdoorLoginCommand : GameCommand<int>
    {
        protected override void Run(GameSession session, int data)
        {
            throw new NotImplementedException();
        }
    }
}
