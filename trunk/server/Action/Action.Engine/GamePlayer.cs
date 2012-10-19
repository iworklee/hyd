using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;

namespace Action.Engine
{
    public class GamePlayer
    {
        private GameSession _session;
        public GameSession Session
        {
            get { return _session; }
        }

        public GamePlayer(GameSession session)
        {
            _session = session;
        }

        public string Account { get; set; }
        public string Name { get; set; }
        public bool IsOnline { get; set; }
        public int SceneId { get; set; }
        public Vector2 Position { get; set; }
    }
}
