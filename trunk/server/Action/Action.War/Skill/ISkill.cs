using Action.Model;
using Action.War;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Buff;

namespace Action.Skill
{
    public interface ISkill
    {
        int Id { get; set; }
        Area Range { get; set; }
        IEnumerable<Effect> Effects { get; set; }
        IEnumerable<BattleEffect> Cast(CombatUnit self);
    }

    public abstract class SkillBase : ISkill
    {
        public int Id { get; set; }
        public Area Range { get; set; }
        public IEnumerable<Effect> Effects { get; set; }

        //protected abstract bool Ready(CombatUnit self);
        //protected abstract BattleEffectType GetDamageType();
        //private AttackType _attackType;
        //protected SkillBase(AttackType type)
        //{
        //    _attackType = type;
        //}

        public IEnumerable<BattleEffect> Cast(CombatUnit self)
        {
            //if (!Ready(self))
            //    return null;

            var targets = Range.FindBy(self);
            if (!targets.Any())
                return null;

            var target = targets.First();
            var direction = target.Position - self.Position;
            return Effects.SelectMany(
                effect => effect.Range.FindBy(self, direction).SelectMany(
                    unit => effect.Buffs.SelectMany(
                        buff => buff.Affect(self, unit))));

            //foreach (var effect in Effects)
            //{
            //    foreach (var unit in effect.Range.FindBy(target))
            //    {
            //        foreach (var buff in effect.Buffs)
            //        {
            //            yield return buff.Affect(unit);
            //        }
            //    }
            //}
        }
    }
}

