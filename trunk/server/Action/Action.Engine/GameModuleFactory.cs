using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.Composition;

namespace Action.Engine
{
    public class GameModuleFactory
    {
        [ImportMany]
        private IGameModule[] _modules = null;
        public IGameModule[] Modules
        {
            get { return _modules; }
        }

        private GameModuleFactory()
        {
            Composition.ComposeParts(this);
        }

        private static readonly Lazy<GameModuleFactory> instance = new Lazy<GameModuleFactory>(() => new GameModuleFactory());
        public static GameModuleFactory Current
        {
            get
            {
                return instance.Value;
            }
        }

    }
}
