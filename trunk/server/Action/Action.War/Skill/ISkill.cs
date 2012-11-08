using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Skill
{
    public interface ISkill
    {
        int Id { get; }
        IEnumerable<Vector2> Range { get; }
    }
}
