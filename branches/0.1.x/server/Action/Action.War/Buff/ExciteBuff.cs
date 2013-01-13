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
    /// 加气势
    /// </summary>
    [Buff(12)]
    public class ExciteBuff : IBuff
    {
        public int Id { get; set; }
        public float Value { get; set; }
        public IEnumerable<BattleEffect> Affect(CombatUnit self, CombatUnit target)
        {
            if (target is CombatTacticUnit)
            {
                target.Charge += (int)Value;
                yield return new BattleEffect { Type = BattleEffectType.AddMP, UnitSID = target.BattleID, PlusMP = (int)Value };
            }
        }
    }
}

