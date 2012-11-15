using Action.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;

namespace Action.War
{
    /// <summary>
    /// 营地
    /// </summary>
    public class CombatCampUnit : CombatUnit
    {
        //public CombatCampUnit(CombatMilitary military) : base(military) { }

        public override IEnumerable<Vector2> StrikeRange
        {
            get
            {
                return Enumerable.Empty<Vector2>();
            }
            set
            {
            }
        }
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
        public override BattleAction Move()
        {
            return null;
        }
    }
}
