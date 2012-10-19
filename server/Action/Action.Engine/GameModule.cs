using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Engine
{
    public interface IGameModule
    {
        void OnStartup(GameServer server);
        void OnStopped(GameServer server);
        void OnAppSessionClosed(GameSession session);
    }
}
