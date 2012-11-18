using Action.Engine;
using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using Action.ResourceManager;
using Action.War;

namespace Action.Buff
{
    public class BuffFactory
    {
        [ImportMany]
        private static IEnumerable<IBuff> _buffs;

        static BuffFactory()
        {
            Composition.ComposeParts(_buffs);
        }

        public static IBuff Create(int buffID, float value)
        {
            return null;
        }
    }
}
