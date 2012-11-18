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

        public override BattleAction SkillStrike()
        {
            return null;
        }

        protected override IEnumerable<BattleEffect> UnderAttack(BattleEffect effect)
        {
            if (Health <= 0)
                Military.Defeated = true;

            return base.UnderAttack(effect);
        }

        public override BattleAction Move()
        {
            return null;
        }
    }
}
