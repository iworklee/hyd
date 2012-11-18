using Action.Model;
using Action.War;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Buff
{
    public class Effect
    {
        public Area Range { get; set; }
        public IEnumerable<IBuff> Buffs { get; set; }
    }
}

