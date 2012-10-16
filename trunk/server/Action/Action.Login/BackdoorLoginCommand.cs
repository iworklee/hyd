using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Command;
using SuperSocket.Common;
using Action.Engine;
using Action.Model.Protobuf;

namespace Action.Login
{
    [GameCommand(1000)]
    public class BackdoorLoginCommand : GameCommand<BackdoorLoginArgs>
    {
        protected override void Run(GameSession session, BackdoorLoginArgs args)
        {
            throw new NotImplementedException();
        }
    }
}
