using Action.Model;
using Action.War;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Buff
{
    /// <summary>
    /// 重置自己的气势
    /// </summary>
    [Buff(14)]
    public class ResetOwnChargeBuff : IBuff
    {
        public int Id { get; set; }
        public float Value { get; set; }
        public IEnumerable<BattleEffect> Affect(CombatUnit self, CombatUnit target)
        {
            var plus = (int)Value - self.Charge;
            self.Charge = (int)Value;
            yield return new BattleEffect { UnitSID = self.BattleID, PlusMP = plus };
        }
    }
}

