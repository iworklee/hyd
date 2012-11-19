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
    /// 战法技能攻击
    /// </summary>
    [Buff(1)]
    public class TacticBuff : IBuff
    {
        public int Id { get; set; }
        public float Value { get; set; }
        public IEnumerable<BattleEffect> Affect(CombatUnit self, CombatUnit target)
        {
            var damageType = Helper.Test(self.CriticalChance, target.BlockChance, 0);
            return self.DoAttack(target, AttackType.Tactic, damageType, Value);
        }
    }
}

