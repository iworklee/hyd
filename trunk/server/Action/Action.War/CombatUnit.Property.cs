using Action.Model;
using Action.Skill;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.War
{
    /// <summary>
    /// 普通单位
    /// </summary>
    public partial class CombatUnit
    {
        /// <summary>
        /// 所属军队
        /// </summary>
        public CombatMilitary Military { get; set; }

        /// <summary>
        /// 战斗单位类型标识
        /// </summary>
        public int UnitTypeID { get; set; }

        /// <summary>
        /// 战斗单位战场标识
        /// </summary>
        public int BattleID { get; set; }

        /// <summary>
        /// 位置坐标
        /// </summary>
        public Vector2 Position { get; set; }

        /// <summary>
        /// 攻击
        /// </summary>
        private Dictionary<AttackType, int> _attack = new Dictionary<AttackType, int>();

        /// <summary>
        /// 防御
        /// </summary>
        private Dictionary<AttackType, int> _defence = new Dictionary<AttackType, int>();

        #region 攻防属性

        /// <summary>
        /// 普通攻击
        /// </summary>
        public int NormalAttack { get; set; }
        /// <summary>
        /// 普通防御
        /// </summary>
        public int NormalDefence { get; set; }

        /// <summary>
        /// 战法攻击
        /// </summary>
        public int TacticAttack { get; set; }
        /// <summary>
        /// 战法防御
        /// </summary>
        public int TacticDefence { get; set; }

        /// <summary>
        /// 策略攻击
        /// </summary>
        public int StrategyAttack { get; set; }
        /// <summary>
        /// 策略防御
        /// </summary>
        public int StrategyDefence { get; set; }

        #endregion

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

        /// <summary>
        /// 生命值
        /// </summary>
        public int Health { get; set; }

        /// <summary>
        /// 气势
        /// </summary>
        public int Charge { get; set; }

        /// <summary>
        /// 战斗力
        /// </summary>
        public int CombatPower { get; set; }

        /// <summary>
        /// 攻击范围
        /// </summary>
        public IEnumerable<Vector2> StrikeRange { get; set; }

        /// <summary>
        /// 技能ID
        /// </summary>
        public int SkillID { get; set; }

    }
}
