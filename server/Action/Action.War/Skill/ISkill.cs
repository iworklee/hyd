using Action.Model;
using Action.War;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Skill
{
    public interface ISkill
    {
        int Id { get; }
        IEnumerable<Vector2> Range { get; }
        int TargetCount { get; }
        IEnumerable<BattleEffect> Cast(CombatUnit unit);
    }

    public abstract class SkillBase<T> : ISkill where T : CombatUnit
    {
        public abstract IEnumerable<BattleEffect> Casting(T unit);

        public IEnumerable<BattleEffect> Cast(CombatUnit unit)
        {
            return Casting((T)unit);
        }

        public abstract int Id { get; }

        public abstract IEnumerable<Vector2> Range { get; }

        public abstract int TargetCount { get; }
    }
}

