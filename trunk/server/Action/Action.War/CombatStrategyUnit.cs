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

        /// <summary>
        /// 可以释放技能
        /// </summary>
        /// <returns></returns>
        public override bool SkillReady()
        {
            var rng = new Random();
            return true;
        }
    }
}
