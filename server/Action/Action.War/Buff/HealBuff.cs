using Action.Model;
using Action.War;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Buff
{
    [Buff(1)]
    public class HealBuff : IBuff
    {
        public int Id { get; set; }
        public float Value { get; set; }
        public BattleEffect Affect(CombatUnit self, CombatUnit target)
        {
            target.Health += (int)Value;
            return new BattleEffect { UnitSID = target.BattleID, PlusMP = (int)Value };
        }
    }
}

