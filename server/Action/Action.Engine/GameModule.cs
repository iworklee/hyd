using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Engine
{
    public interface IGameModule
    {
        void Load(GameWorld world);
        void Unload(GameWorld world);
        void EnterGame(GamePlayer player);
        void LeaveGame(GamePlayer player);
    }
}
