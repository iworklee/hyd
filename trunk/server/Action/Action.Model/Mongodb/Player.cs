using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Model
{
    public struct Point
    {
        public int X{get;set;}
        public int Y{get;set;}
    }

    public class Player
    {
        public Player()
        {
        }

        public string Account { get; set; }
        public string Name { get; set; }
        public int SceneId { get; set; }
        public Point Position { get; set; }
        public Role Role { get; set; }
    }
}
