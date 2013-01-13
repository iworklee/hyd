using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.War
{
    public class RangeProvider
    {
        public static IEnumerable<Vector2> Generate(string range)
        {
            return range.Split(new[] { ';' }, StringSplitOptions.RemoveEmptyEntries)
                .Select(p =>
                {
                    var v = p.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                    return new Vector2(int.Parse(v[0]), int.Parse(v[1]));
                });
        }


    }
}
