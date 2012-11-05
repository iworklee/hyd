using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.War
{
    static class Helper
    {
        public static int Pos2Int(this Vector2 pos)
        {
            return (int)(pos.X * 5 + pos.Y);
        }

        public static Vector2 Int2Pos(this int pos)
        {
            return new Vector2(pos / 5, pos % 5);
        }
    }
}
