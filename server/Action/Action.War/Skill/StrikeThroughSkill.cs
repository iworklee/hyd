using Action.Model;
using Action.War;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Skill
{
    public class StrikeThroughSkill : SkillBase<CombatTacticUnit>
    {
        public override int Id
        {
            get { return 111; }
        }

        public override IEnumerable<Vector2> Range
        {
            get
            {
                yield return new Vector2 { X = 1, Y = 0 };
                yield return new Vector2 { X = 2, Y = 0 };
                yield return new Vector2 { X = 3, Y = 0 };
                yield return new Vector2 { X = 4, Y = 0 };
                yield return new Vector2 { X = 5, Y = 0 };
            }
        }

        public override int TargetCount
        {
            get { return 5; }
        }

        public override IEnumerable<BattleEffect> Casting(CombatTacticUnit unit)
        {
            // 根据攻击范围，找攻击目标
            var targets = Range
                .Select(loc => unit.Military.Enemy.GetAliveUnitByPos(unit.Position + loc * unit.Military.Forward))
                .Where(u => u != null)
                .Take(TargetCount);

            foreach (var target in targets)
            {
                // 计算格挡，暴击
                var damageType = Helper.Test(unit.CriticalChance, target.BlockChance, 0);
                yield return unit.Attacking(target, AttackType.Tactic, damageType);
            }
        }
    }
}
