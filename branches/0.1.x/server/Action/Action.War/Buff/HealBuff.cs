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
    /// 加血
    /// </summary>
    [Buff(11)]
    public class HealBuff : IBuff
    {
        public int Id { get; set; }
        public float Value { get; set; }
        public IEnumerable<BattleEffect> Affect(CombatUnit self, CombatUnit target)
        {
            var hp = target.Health + (int)Value;
            if (hp > target.HealthMax)
                hp = target.HealthMax;

            var effect = new BattleEffect { Type = BattleEffectType.Cure, UnitSID = target.BattleID, PlusHP = hp - target.Health };
            target.Health = hp;
            yield return effect;
        }
    }
}

