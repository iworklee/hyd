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
    public partial class CombatUnit
    {
        //public CombatUnit(CombatMilitary military)
        //{
        //    Military = military;
        //}

        public CombatUnit()
        {
            Level = 1;
        }

        /// <summary>
        /// 普通攻击
        /// </summary>
        /// <returns></returns>
        public BattleAction Strike()
        {
            BattleAction ba;

            // 使用技能攻击
            ba = SkillStrike();
            if (ba != null)
                return ba;

            // 根据攻击范围，找攻击目标
            var target = StrikeRange
                .Select(loc => Military.Enemy.GetAliveUnitByPos(this.Position + loc * Military.Forward))
                .Where(unit => unit != null)
                .FirstOrDefault();
            if (target == null)
                return null;

            // 计算格挡，暴击
            var damageType = Helper.Test(this.CriticalChance, target.BlockChance, 0);

            var effect = Attacking(target, AttackType.Normal, damageType, 1);

            ba = new BattleAction();
            ba.UnitSID = this.BattleID;
            ba.Type = BattleActionType.Cast; // 攻击
            ba.Param = 0; // 普通攻击
            ba.Effects.Add(effect);
            return ba;
        }

        /// <summary>
        /// 攻击计算
        /// </summary>
        /// <param name="target">攻击目标</param>
        /// <param name="attackType">攻击类型（普通、战法、策略）</param>
        /// <param name="effectType">攻击效果（闪避、格挡、重击）</param>
        /// <param name="damageRatio">伤害系数</param>
        /// <returns></returns>
        public virtual BattleEffect Attacking(CombatUnit target, AttackType attackType, BattleEffectType effectType, float damageRatio)
        {
            var ratio = (int)effectType;

            var damage = this._attack[attackType] - target._defence[attackType] + this.Level * 50;
            if (damage < 1)
                damage = 1;
            damage = (int)(damage * ratio * 0.5);

            target.Health -= damage;

            var effect = new BattleEffect { UnitSID = target.BattleID, PlusHP = -damage, Type = effectType };

            target.Attacked(effect);

            return effect;
        }

        protected virtual void Attacked(BattleEffect effect)
        {
            if (Health <= 0)
                Military.Die(this);
        }

        /// <summary>
        /// 技能攻击
        /// </summary>
        /// <returns></returns>
        public virtual BattleAction SkillStrike()
        {
            return null;
        }

        public static explicit operator BattleUnit(CombatUnit unit)
        {
            var bu = new BattleUnit();
            bu.Id = unit.UnitTypeID;
            bu.SID = unit.BattleID;
            bu.HP = unit.Health;
            bu.MP = unit.Charge;
            bu.Pos = unit.Position.Pos2Int();
            return bu;
        }


        public virtual BattleAction Move()
        {
            return Military.Move(this);
        }
    }
}
