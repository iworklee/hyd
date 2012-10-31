﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.War
{
    public class CombatUnit
    {
        /// <summary>
        /// 普通攻击
        /// </summary>
        public int NormalAttack { get; set; }
        /// <summary>
        /// 普通防御
        /// </summary>
        public int NormalDefender { get; set; }

        /// <summary>
        /// 战法攻击
        /// </summary>
        public int TacticAttack { get; set; }
        /// <summary>
        /// 战法防御
        /// </summary>
        public int TacticDefender { get; set; }

        /// <summary>
        /// 策略攻击
        /// </summary>
        public int StrategyAttack { get; set; }
        /// <summary>
        /// 策略防御
        /// </summary>
        public int StrategyDefender { get; set; }

        /// <summary>
        /// 暴击
        /// </summary>
        public float CriticalChance { get; set; }

        /// <summary>
        /// 格挡
        /// </summary>
        public float BlockChance { get; set; }

        /// <summary>
        /// 闪避
        /// </summary>
        public float DodgeChance { get; set; }

    }
}