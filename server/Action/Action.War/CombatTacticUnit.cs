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

        public CombatTacticUnit(CombatMilitary military) : base(military) { }

        /// <summary>
        /// 可以释放技能
        /// </summary>
        /// <returns></returns>
        public override bool SkillReady()
        {
            return Charge > 100;
        }

        public override BattleAction SkillStrike()
        {
            if (SkillStrikeRange == 0)
                return null;

            // 根据攻击范围，找攻击目标
            var targets = Military.Enemy.AliveUnits.Where(unit => Vector2.Distance(this.Position, unit.Position) <= SkillStrikeRange);
            var target = targets.FirstOrDefault();
            if (target == null)
                return null;

            // 计算格挡，暴击
            var damageType = Helper.Test(this.CriticalChance, target.BlockChance, 0);
            var defence = target.TacticDefence;
            if (damageType == DamageType.Block)
                defence = defence * 2;
            var attack = this.TacticAttack;
            if (damageType == DamageType.Critical)
                attack = (int)(attack * 1.5);

            var damage = attack - defence;
            if (damage < 1)
                damage = 1;
            if (damage > target.Health)
                damage = target.Health;
            target.Health -= damage;

            var ba = new BattleAction();
            ba.UnitSID = this.BattleID;
            ba.Type = BattleActionType.Cast; // 攻击
            ba.Param = 1; // 技能ID
            ba.Effects.Add(new BattleEffect() { UnitSID = target.BattleID, Type = BattleEffectType.Normal, PlusHP = -damage, PlusMP = 0 });
            return ba;
        }
    }
}
