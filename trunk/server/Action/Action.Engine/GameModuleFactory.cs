using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.Composition;
using Action.Core;

namespace Action.Engine
{
    public class GameModuleFactory : Singleton<GameModuleFactory>
    {
        [ImportMany]
        private IGameModule[] _modules = null;
        public IGameModule[] Modules
        {
            get { return _modules;}
        }

        public GameModuleFactory()
        {
            Composition.ComposeParts(this);
        }
    }
}
