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
    public class ResetChargeBuff : IBuff
    {
        public int Id { get; set; }
        public float Value { get; set; }
        public BattleEffect Affect(CombatUnit self, CombatUnit target)
        {
            var plus = (int)Value - self.Charge;
            self.Charge = (int)Value;
            return new BattleEffect { UnitSID = self.BattleID, PlusMP = plus };
        }
    }
}

