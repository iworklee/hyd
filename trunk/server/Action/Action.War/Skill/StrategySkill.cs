using Action.Model;
using Action.War;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Skill
{
    public class StrategySkill : SkillBase
    {
        /*
        public override IEnumerable<BattleEffect> Casting(CombatStrategyUnit unit)
        {
            // 根据攻击范围，找攻击目标
            var targets = Range
                .Select(loc => unit.Military.GetAliveUnitByPos(unit.Position + loc * unit.Military.Forward))
                .Where(u => u != null)
                .Take(TargetCount);

            foreach (var target in targets)
            {
                target.Charge += 50;
                yield return new BattleEffect { UnitSID = target.BattleID, PlusMP = 50 };
            }
        }

        public override float DamageRatio
        {
            get { return 0.8f; }
        }
         */
    }
}
