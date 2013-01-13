using Action.Engine;
using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using Action.ResourceManager;
using Action.War;
using Action.Buff;
using System.Diagnostics;

namespace Action.Skill
{
    public class SkillFactory
    {
        private SkillFactory()
        {
            //Composition.ComposeParts(this);
        }

        private static readonly Lazy<SkillFactory> instance = new Lazy<SkillFactory>(() => new SkillFactory());
        public static SkillFactory Instance
        {
            get
            {
                return instance.Value;
            }
        }

        public ISkill GetSkill(int skillID)
        {
            XElement xml;
            Resources.Instance.Skills.TryGetValue(skillID, out xml);
            Debug.Assert(xml != null);
            var t = Type.GetType((string)xml.Element("Type"));
            ISkill skill = Activator.CreateInstance(t) as ISkill;
            skill.Id = skillID;
            skill.Range = new Area(xml.Element("Area"));
            skill.Effects = xml.Element("Effects").Elements()
                .Select(x => new Effect
                {
                    Range = new Area(x.Element("Area")),
                    Buffs = x.Element("Buffs").Elements()
                    .Select(b => BuffFactory.Instance.CreateBuff((int)b.Element("ID"), (float)b.Element("Value")))
                });
            return skill;

            /*
            // 1、2、3战法，101、106策略
            ISkill skill;
            switch (skillID)
            {
                case 111:
                    skill = new StrikeThroughSkill();
                    break;
                default:
                    skill = new StrikeThroughSkill();
                    break;
            }
             */
        }
    }
}
