using Action.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.War
{
    /// <summary>
    /// 营地
    /// </summary>
    public class CombatCampUnit : CombatUnit
    {
        //public CombatCampUnit(CombatMilitary military) : base(military) { }

        public override BattleEffect Attacking(CombatUnit target, AttackType attackType, BattleEffectType effectType, float damageRatio)
        {
            return null;
        }

        public override BattleAction SkillStrike()
        {
            return null;
        }
        protected override void Attacked(BattleEffect effect)
        {
            if (Health <= 0)
                Military.Defeated = true;
        }
    }
}
