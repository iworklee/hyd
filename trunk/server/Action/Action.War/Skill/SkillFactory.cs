using Action.Engine;
using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using System.Linq;
using System.Text;

namespace Action.Skill
{
    public class SkillFactory
    {
        [ImportMany]
        private ISkill[] _skills = null;
        public ISkill[] AllSkill
        {
            get { return _skills; }
        }

        private SkillFactory()
        {
            Composition.ComposeParts(this);
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
            return skill;
        }
    }
}
