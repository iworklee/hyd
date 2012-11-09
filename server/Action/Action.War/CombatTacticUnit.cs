using Action.Model;
using Microsoft.Xna.Framework;
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
        const int CHARGE_PLUS = 25;

        public CombatTacticUnit(CombatMilitary military) : base(military) { }

        public override BattleAction SkillStrike()
        {
            // 可以释放技能
            if (Charge < 100)
                return null;

            // 根据攻击范围，找攻击目标
            var target = _skill.Range
                .Select(loc => Military.Enemy.GetAliveUnitByPos(this.Position + loc * Military.Forward))
                .Where(unit => unit != null)
                .FirstOrDefault();
            if (target == null)
                return null;

            // 计算格挡，暴击
            var damageType = Helper.Test(this.CriticalChance, target.BlockChance, 0);

            var effect = Attacking(target, AttackType.Tactic, damageType);

            var ba = new BattleAction();
            ba.UnitSID = this.BattleID;
            ba.Type = BattleActionType.Cast; // 攻击
            ba.Param = SkillID; // 战法攻击
            ba.Effects.Add(effect);
            return ba;
        }
        protected override BattleEffect Attacking(CombatUnit target, AttackType attackType, BattleEffectType effectType)
        {
            if (effectType != BattleEffectType.Dodge)
                Charge += CHARGE_PLUS;

            return base.Attacking(target, attackType, effectType);
        }

        protected override void Attacked(BattleEffect effect)
        {
            if (effect.Type != BattleEffectType.Dodge)
                Charge += CHARGE_PLUS;
        }
    }
}
