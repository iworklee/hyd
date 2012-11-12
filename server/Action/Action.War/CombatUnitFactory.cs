using Action.Engine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.War
{
    public class CombatUnitFactory
    {

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

                case 11:
                    unit = new CombatTacticUnit();
                    break;
                case 12:
                    unit = new CombatStrategyUnit();
                    break;

                default:
                    unit = new CombatUnit();
                    break;
            }
            unit.Health = 1000;
            return unit;
        }
    }
}
