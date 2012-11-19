using Action.Model;
using Action.War;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Buff
{
    [Buff(11)]
    public class HealBuff : IBuff
    {
        public int Id { get; set; }
        public float Value { get; set; }
        public BattleEffect Affect(CombatUnit self, CombatUnit target)
        {
            var hp = target.Health + (int)Value;
            if (hp > target.HealthMax)
                hp = target.HealthMax;

            var effect = new BattleEffect { UnitSID = target.BattleID, PlusHP = hp - target.Health };
            target.Health = hp;
            return effect;
        }
    }
}

