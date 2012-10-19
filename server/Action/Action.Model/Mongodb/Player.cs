using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;

namespace Action.Model
{
    public class Player
    {
        public Player()
        {
        }

        public string Account { get; set; }
        public string Name { get; set; }
        public int SceneId { get; set; }
        public Vector2 Position { get; set; }
        public Role Role { get; set; }
    }
}
