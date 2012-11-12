using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.War
{
    public class RangeProvider
    {
        public static IEnumerable<Vector2> None()
        {
            return Enumerable.Empty<Vector2>();
        }

        public static IEnumerable<Vector2> Melee()
        {
            yield return new Vector2(1, 0);
            yield return new Vector2(0, -1);
            yield return new Vector2(0, 1);
        }

        public static IEnumerable<Vector2> Archer()
        {
            yield return new Vector2(1, 0);
            yield return new Vector2(2, 0);
            yield return new Vector2(0, -1);
            yield return new Vector2(0, 1);
            yield return new Vector2(0, -2);
            yield return new Vector2(0, 2);
        }
    }
}
