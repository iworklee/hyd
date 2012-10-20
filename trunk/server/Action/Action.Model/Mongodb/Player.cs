using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using MongoDB.Bson.Serialization.Attributes;

namespace Action.Model
{
    public class Player : BsonClass
    {
        public Player()
        {
            Role = new Role();
            Right = new Right();
        }

        public string Name { get; set; }

        public string Account { get; set; }
        public int SceneId { get; set; }

        [BsonSerializer(typeof(StructBsonSerializer))]
        public Vector2 Position { get; set; }

        public Role Role { get; set; }
        public Right Right { get; set; }
    }
}
