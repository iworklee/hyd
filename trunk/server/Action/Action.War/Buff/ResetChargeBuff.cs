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
    /// 重置气势
    /// </summary>
    [Buff(13)]
    public class ResetChargeBuff : IBuff
    {
        public int Id { get; set; }
        public float Value { get; set; }
        public IEnumerable<BattleEffect> Affect(CombatUnit self, CombatUnit target)
        {
            var plus = (int)Value - target.Charge;
            target.Charge = (int)Value;
            yield return new BattleEffect { Type = BattleEffectType.ReduceMP, UnitSID = target.BattleID, PlusMP = plus };
        }
    }
}

