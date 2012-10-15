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
        public virtual void Load(GameServer server) { }
        public virtual void Unload(GameServer server) { }
    }
}
