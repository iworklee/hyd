using Action.Model;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

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

        private static Random rng = new Random();
        public static BattleEffectType Test(float criticalChance, float blockChance, float dodgeChance)
        {
            var n = rng.NextDouble();
            BattleEffectType effect;
            if (n < dodgeChance)
                effect = BattleEffectType.Dodge;
            else if (n < dodgeChance + blockChance)
                effect = BattleEffectType.Block;
            else if (n < dodgeChance + blockChance + criticalChance)
                effect = BattleEffectType.Critical;
            else
                effect = BattleEffectType.Normal;

            Debug.WriteLine("Random {0}, {1}", n, effect);
            return effect;
        }
    }
}
