using Action.Engine;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.War
{
    public class CombatUnitFactory
    {
        private Random _rng = new Random();

        private CombatUnitFactory()
        {
            Composition.ComposeParts(this);
        }

        private static readonly Lazy<CombatUnitFactory> instance = new Lazy<CombatUnitFactory>(() => new CombatUnitFactory());
        public static CombatUnitFactory Instance
        {
            get
            {
                return instance.Value;
            }
        }

        public CombatUnit CreateUnit(int unitID)
        {
            CombatUnit unit;
            switch (unitID)
            {
                // 步兵
                case 801:
                    unit = new CombatUnit();
                    break;

                // 弓兵
                case 804:
                    unit = new CombatUnit();
                    unit.StrikeRange = RangeProvider.Archer();
                    break;

                // 骑兵
                case 13:
                    unit = new CombatUnit();
                    break;

                // 关羽                    
                case 21:
                    unit = new CombatTacticUnit();
                    unit.SkillID = 101;
                    unit.Charge = 50;
                    break;

                // 诸葛亮                    
                case 22:
                    unit = new CombatStrategyUnit();
                    unit.SkillID = 102;
                    break;

                // 城墙
                case 0:
                    unit = new CombatCampUnit();
                    break;

                // 步兵
                default:
                    unit = new CombatUnit();
                    break;
            }
            unit.UnitTypeID = unitID;
            unit.Health = _rng.Next(800, 1000);

            unit.NormalAttack = _rng.Next(80, 100);
            unit.NormalDefence = _rng.Next(80, 100);
            unit.TacticAttack = _rng.Next(80, 100);
            unit.TacticDefence = _rng.Next(80, 100);
            unit.StrategyAttack = _rng.Next(80, 100);
            unit.StrategyDefence = _rng.Next(80, 100);

            unit.DodgeChance = _rng.Next(0, 20) / 100f;
            unit.BlockChance = _rng.Next(0, 30) / 100f;
            unit.CriticalChance = _rng.Next(0, 40) / 100f;

            unit.CombatPower = unit.NormalAttack + unit.TacticAttack + unit.StrategyAttack;
            return unit;
        }
    }
}
