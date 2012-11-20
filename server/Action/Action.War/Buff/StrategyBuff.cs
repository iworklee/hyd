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
    /// 策略技能攻击
    /// </summary>
    [Buff(2)]
    public class StrategyBuff : IBuff
    {
        public int Id { get; set; }
        public float Value { get; set; }
        public IEnumerable<BattleEffect> Affect(CombatUnit self, CombatUnit target)
        {
            var damageType = Helper.Test(self.CriticalChance, 0, target.DodgeChance);
            var ratio = Value * self.Charge / 100f;
            return self.DoAttack(target, AttackType.Strategy, damageType, ratio);
        }
    }
}

