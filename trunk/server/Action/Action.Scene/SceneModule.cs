using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.Composition;
using Action.Engine;

namespace Action.Scene
{
    [Export(typeof(IGameModule))]
    public class SceneModule : IGameModule
    {
        public void Load(GameServer server)
        {
            
        }

        public void Unload(GameServer server)
        {
            
        }
    }
}
