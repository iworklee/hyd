using Action.Model;
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

        public static BattleEffectType Test(float criticalChance, float blockChance, float dodgeChance)
        {
            var rng = new Random();
            var n = rng.NextDouble();
            if (n < dodgeChance)
                return BattleEffectType.Dodge;
            else if (n < dodgeChance + blockChance)
                return BattleEffectType.Block;
            else if (n < dodgeChance + blockChance + criticalChance)
                return BattleEffectType.Critical;
            else
                return BattleEffectType.Normal;
        }
    }
}
