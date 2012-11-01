using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.War
{
    /// <summary>
    /// 战法型武将
    /// </summary>
    public class CombatTacticUnit : CombatUnit
    {
        const int MAX_CHARGE = 100;

        /// <summary>
        /// 气势
        /// </summary>
        public int Charge { get; set; }

        /// <summary>
        /// 可以释放技能
        /// </summary>
        /// <returns></returns>
        public override bool SkillReady()
        {
            return Charge > 100;
        }
    }
}
