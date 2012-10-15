using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Engine
{
    public interface IGameModule
    {
        void Load(GameServer server);
        void Unload(GameServer server);
    }

    public abstract class GameModule : IGameModule
    {
        public abstract void Load(GameServer server);
        public abstract void Unload(GameServer server);
    }
}
