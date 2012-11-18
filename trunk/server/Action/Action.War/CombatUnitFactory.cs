using Action.Engine;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.ResourceManager;
using System.Xml.Linq;

namespace Action.War
{
    public class CombatUnitFactory
    {
        private CombatUnitFactory()
        {
            //Composition.ComposeParts(this);
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
            XElement xml;
            if (!Resources.Instance.UnitType.TryGetValue(unitID, out xml))
            {
                xml = new XElement("Unit",
                        new XElement("ID", 0),
                        new XElement("Type", "Action.War.CombatCampUnit"),
                        new XElement("StrikeRange", ""),
                        new XElement("Health", 1000),
                        new XElement("SkillID", 0),
                        new XElement("Charge", 0),
                        new XElement("NormalAttack", 0),
                        new XElement("NormalDefence", 0),
                        new XElement("TacticAttack", 0),
                        new XElement("TacticDefence", 0),
                        new XElement("StrategyAttack", 0),
                        new XElement("StrategyDefence", 0),
                        new XElement("DodgeChance", 0),
                        new XElement("BlockChance", 0),
                        new XElement("CriticalChance", 0)
                        );
            }
            var t = Type.GetType((string)xml.Element("Type"));
            CombatUnit unit = Activator.CreateInstance(t) as CombatUnit;

            unit.UnitTypeID = unitID;
            unit.StrikeRange = RangeProvider.Generate((string)xml.Element("StrikeRange"));

            unit.Health = (int)xml.Element("Health");
            unit.SkillID = (int)xml.Element("SkillID");
            unit.Charge = (int)xml.Element("Charge");

            unit.NormalAttack = (int)xml.Element("NormalAttack");
            unit.NormalDefence = (int)xml.Element("NormalDefence");
            unit.TacticAttack = (int)xml.Element("TacticAttack");
            unit.TacticDefence = (int)xml.Element("TacticDefence");
            unit.StrategyAttack = (int)xml.Element("StrategyAttack");
            unit.StrategyDefence = (int)xml.Element("StrategyDefence");

            unit.DodgeChance = (float)xml.Element("DodgeChance");
            unit.BlockChance = (float)xml.Element("BlockChance");
            unit.CriticalChance = (float)xml.Element("CriticalChance");

            unit.CombatPower = unit.NormalAttack + unit.TacticAttack + unit.StrategyAttack;

            return unit;
        }
    }
}
