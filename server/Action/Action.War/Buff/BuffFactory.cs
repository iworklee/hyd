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
        private IEnumerable<Lazy<IBuff, BuffMetaData>> _buffs = null;

        private Dictionary<int, Type> _buffTypes;

        private BuffFactory()
        {
            Composition.ComposeParts(this);
            _buffTypes = _buffs.ToDictionary(k => k.Metadata.BuffId, v => v.Value.GetType());
        }

        private static readonly Lazy<BuffFactory> instance = new Lazy<BuffFactory>(() => new BuffFactory());
        public static BuffFactory Instance
        {
            get
            {
                return instance.Value;
            }
        }

        public IBuff CreateBuff(int buffID, float value)
        {
            Type t;
            _buffTypes.TryGetValue(buffID, out t);
            IBuff buff = Activator.CreateInstance(t) as IBuff;
            buff.Id = buffID;
            buff.Value = value;
            return buff;
        }
    }
}
