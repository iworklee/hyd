using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.War
{
    public enum AttackType
    {
        /// <summary>
        /// 普通
        /// </summary>
        Normal,

        /// <summary>
        /// 战法
        /// </summary>
        Tactic,

        /// <summary>
        /// 策略
        /// </summary>
        Strategy,
    }

    public enum DamageType
    {
        /// <summary>
        /// 普通
        /// </summary>
        Normal,

        /// <summary>
        /// 暴击
        /// </summary>
        Critical,

        /// <summary>
        /// 格挡
        /// </summary>
        Block,

        /// <summary>
        /// 闪避
        /// </summary>
        Dodge,

    }
}
