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
        public override bool SkillReady
        {
            get
            {
                return Charge > 100;
            }
        }

        public override BattleAction SkillStrike()
        {
            if (SkillStrikeRange == 0)
                return null;

            switch (SkillID)
            {
                case 111:
                    break;
                case 112:
                    break;
            }

            // 根据攻击范围，找攻击目标
            var target = StrikeRange
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
    }
}
