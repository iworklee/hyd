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
    /// 重置生命值
    /// </summary>
    [Buff(3)]
    public class ResetHPBuff : IBuff
    {
        public int Id { get; set; }
        public float Value { get; set; }
        public IEnumerable<BattleEffect> Affect(CombatUnit self, CombatUnit target)
        {
            var damageType = Helper.Test(self.CriticalChance, 0, target.DodgeChance);
            if (damageType == BattleEffectType.Dodge)
            {
                yield return new BattleEffect { Type = BattleEffectType.Dodge, UnitSID = target.BattleID };
            }
            else
            {
                var plus = (int)Value - target.Health;
                target.Health = (int)Value;
                target.Military.Die(target);
                yield return new BattleEffect { Type = BattleEffectType.Attack, UnitSID = target.BattleID, PlusHP = plus };
            }
        }
    }
}

