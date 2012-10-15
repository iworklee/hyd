using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase;
using SuperSocket.SocketBase.Command;

namespace Action.Engine
{
    public class GameServer : AppServer<GameSession, BinaryCommandInfo>
    {

        protected override void OnStartup()
        {
            base.OnStartup();
            // TODO 模块加载逻辑 
        }

    }
}
