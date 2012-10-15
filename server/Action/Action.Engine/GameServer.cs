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

        public GameServer()
            : base(new GameProtocol())
        {
        }

        protected override void OnStartup()
        {
            base.OnStartup();
            foreach (var module in GameModuleFactory.Current.Modules)
                module.Load(this);
        }

        protected override void OnStopped()
        {
            base.OnStopped();
            foreach (var module in GameModuleFactory.Current.Modules)
                module.Unload(this);
        }
    }
}
