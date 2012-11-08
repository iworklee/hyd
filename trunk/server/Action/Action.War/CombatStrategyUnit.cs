using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.War
{
    /// <summary>
    /// 策略型武将
    /// </summary>
    public class CombatStrategyUnit : CombatUnit
    {
        /// <summary>
        /// 技能施放概率
        /// </summary>
        public float SkillChance { get; set; }

        public CombatStrategyUnit(CombatMilitary military) : base(military) { }

        /// <summary>
        /// 可以释放技能
        /// </summary>
        public override bool SkillReady
        {
            get
            {
                var rng = new Random();
                return rng.NextDouble() < SkillChance;
            }
        }
    }
}
