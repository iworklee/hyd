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

            var effect = Attacking(target, AttackType.Normal, damageType);

            ba = new BattleAction();
            ba.UnitSID = this.BattleID;
            ba.Type = BattleActionType.Cast; // 攻击
            ba.Param = 0; // 普通攻击
            ba.Effects.Add(effect);
            return ba;
        }

        public virtual BattleEffect Attacking(CombatUnit target, AttackType attackType, BattleEffectType effectType)
        {
            var ratio = (int)effectType;

            var damage = this._attack[attackType] - target._defence[attackType];
            if (damage < 1)
                damage = 1;
            damage = (int)(damage * ratio * 0.5);

            target.Health -= damage;

            var effect = new BattleEffect { UnitSID = target.BattleID, PlusHP = damage, Type = effectType };

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


        public BattleAction Move()
        {
            return Military.Move(this);
        }
    }
}
