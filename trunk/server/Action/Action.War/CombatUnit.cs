using Action.Model;
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
    public class CombatUnit
    {
        /// <summary>
        /// 所属军队
        /// </summary>
        public CombatTroops Troops { get; set; }

        /// <summary>
        /// 战斗单位类型标识
        /// </summary>
        public int ID { get; set; }

        /// <summary>
        /// 战斗单位战场标识
        /// </summary>
        public int SID { get; set; }

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
        public int StrikeRange { get; set; }

        /// <summary>
        /// 技能攻击范围
        /// </summary>
        public int SkillStrikeRange { get; set; }

        /// <summary>
        /// 可以释放技能
        /// </summary>
        /// <returns></returns>
        public virtual bool SkillReady()
        {
            return false;
        }

        /// <summary>
        /// 普通攻击
        /// </summary>
        /// <returns></returns>
        public BattleAction Strike()
        {
            if (StrikeRange == 0)
                return null;

            // 根据攻击范围，找攻击目标
            var targets = Troops.Enemy.AliveUnits.Where(unit => Vector2.Distance(this.Position, unit.Position) <= StrikeRange);
            var target = targets.FirstOrDefault();
            if (target == null)
                return null;

            // 计算格挡，暴击
            var damageType = Helper.Test(this.CriticalChance, target.BlockChance, 0);
            var defence = target.NormalDefence;
            if (damageType == DamageType.Block)
                defence = defence * 2;
            var attack = this.NormalAttack;
            if (damageType == DamageType.Critical)
                attack = (int)(attack * 1.5);

            var damage = attack - defence;
            if (damage < 1)
                damage = 1;
            if (damage > target.Health)
                damage = target.Health;
            target.Health -= damage;

            var ba = new BattleAction();
            ba.UnitSID = this.SID;
            ba.Type = BattleActionType.Cast; // 攻击
            ba.Args = 0; // 普通攻击
            ba.Effects.Add(new BattleEffect() { UnitSID = target.SID, Type = BattleEffectType.Normal, PlusHP = -damage, PlusMP = 0 });
            return ba;
        }

        protected virtual BattleEffect Attacking(CombatUnit unit)
        {
            return null;
        }

        protected virtual void Attacked()
        {
        }

        /// <summary>
        /// 技能攻击
        /// </summary>
        /// <returns></returns>
        public BattleAction SkillStrike()
        {
            return null;
        }

        public static explicit operator BattleUnit(CombatUnit unit)
        {
            var bu = new BattleUnit();
            bu.Id = unit.ID;
            bu.SID = unit.SID;
            bu.HP = unit.Health;
            bu.MP = unit.Charge;
            bu.Pos = unit.Position.Pos2Int();
            return bu;
        }


    }
}
