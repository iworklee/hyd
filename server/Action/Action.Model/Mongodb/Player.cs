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

        // UNDONE 序列化成MongoDB的2d类型
        [BsonSerializer(typeof(StructBsonSerializer))]
        public Vector2 Position { get; set; }

        public Role Role { get; set; }
        public Right Right { get; set; }

        /// <summary>
        /// 军队布阵
        /// </summary>
        public Army Army { get; set; }

        /// <summary>
        /// 拥有英雄
        /// </summary>
        public Hero Heros { get; set; }
    }
}
