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
    /// 重置生命值
    /// </summary>
    [Buff(3)]
    public class ResetHPBuff : IBuff
    {
        public int Id { get; set; }
        public float Value { get; set; }
        public IEnumerable<BattleEffect> Affect(CombatUnit self, CombatUnit target)
        {
            var plus = (int)Value - target.Health;
            target.Health = (int)Value;
            yield return new BattleEffect { UnitSID = target.BattleID, PlusMP = plus };
        }
    }
}

