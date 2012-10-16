using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase;
using SuperSocket.SocketBase.Command;

namespace Action.Engine
{
    public class GameSession : AppSession<GameSession, BinaryCommandInfo>
    {
        public new GameServer AppServer
        {
            get { return (GameServer)base.AppServer; }
        }

        public override void StartSession()
        {
            // TODO 用户会话
        }




    }
}
