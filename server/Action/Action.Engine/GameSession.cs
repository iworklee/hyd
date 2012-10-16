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

        private string _account;
        public string Account
        {
            get { return _account; }
        }

        private bool _enabled;
        public bool Enabled
        {
            get { return _enabled; }
        }

        public void Bind(string account)
        {
            _account = account;
            _enabled = true;
        }
    }
}
