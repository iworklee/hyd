using Action.Model;
using Action.War;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Buff
{
    [Buff(12)]
    public class ExciteBuff : IBuff
    {
        public int Id { get; set; }
        public float Value { get; set; }
        public BattleEffect Affect(CombatUnit self, CombatUnit target)
        {
            if (target is CombatTacticUnit)
            {
                target.Charge += (int)Value;
                return new BattleEffect { UnitSID = target.BattleID, PlusMP = (int)Value };
            }
            return null;
        }
    }
}

