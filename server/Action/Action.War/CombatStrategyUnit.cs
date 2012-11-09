using Action.Model;
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

        public CombatStrategyUnit(CombatMilitary military) : base(military) { }

        public override BattleAction SkillStrike()
        {
            // 可以释放技能
            var rng = new Random();
            if (rng.NextDouble() > SkillChance)
                return null;

            // 根据攻击范围，找攻击目标
            var target = _skill.Range
                .Select(loc => Military.Enemy.GetAliveUnitByPos(this.Position + loc * Military.Forward))
                .Where(unit => unit != null)
                .FirstOrDefault();
            if (target == null)
                return null;

            // 计算闪避，暴击
            var damageType = Helper.Test(this.CriticalChance, 0, target.DodgeChance);

            var effect = Attacking(target, AttackType.Tactic, damageType);

            var ba = new BattleAction();
            ba.UnitSID = this.BattleID;
            ba.Type = BattleActionType.Cast; // 攻击
            ba.Param = SkillID; // 策略攻击
            ba.Effects.Add(effect);
            return ba;
        }
    }
}
