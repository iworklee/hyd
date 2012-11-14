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
        /// 布阵位置
        /// </summary>
        public int EmbattlePos { get; set; }

        /// <summary>
        /// 位置坐标
        /// </summary>
        public Vector2 Position { get; set; }

        #region 攻防属性

        /// <summary>
        /// 攻击
        /// </summary>
        private Dictionary<AttackType, int> _attack = new Dictionary<AttackType, int>();

        /// <summary>
        /// 防御
        /// </summary>
        private Dictionary<AttackType, int> _defence = new Dictionary<AttackType, int>();

        /// <summary>
        /// 普通攻击
        /// </summary>
        public int NormalAttack { get { return _attack[AttackType.Normal]; } set { _attack[AttackType.Normal] = value; } }
        /// <summary>
        /// 普通防御
        /// </summary>
        public int NormalDefence { get { return _defence[AttackType.Normal]; } set { _defence[AttackType.Normal] = value; } }

        /// <summary>
        /// 战法攻击
        /// </summary>
        public int TacticAttack { get { return _attack[AttackType.Tactic]; } set { _attack[AttackType.Tactic] = value; } }
        /// <summary>
        /// 战法防御
        /// </summary>
        public int TacticDefence { get { return _defence[AttackType.Tactic]; } set { _defence[AttackType.Tactic] = value; } }

        /// <summary>
        /// 策略攻击
        /// </summary>
        public int StrategyAttack { get { return _attack[AttackType.Strategy]; } set { _attack[AttackType.Strategy] = value; } }
        /// <summary>
        /// 策略防御
        /// </summary>
        public int StrategyDefence { get { return _defence[AttackType.Strategy]; } set { _defence[AttackType.Strategy] = value; } }

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
        private IEnumerable<Vector2> _strikeRange = RangeProvider.Melee();
        public IEnumerable<Vector2> StrikeRange { get { return _strikeRange; } set { _strikeRange = value; } }

        /// <summary>
        /// 技能ID
        /// </summary>
        public int SkillID { get; set; }

        /// <summary>
        /// 等级
        /// </summary>
        public int Level { get; set; }

    }
}
