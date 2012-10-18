using System;
using System.Collections.Generic;
using System.Collections.Concurrent;
using System.Linq;
using System.Text;

namespace Action.Engine
{
    public class GameScene
    {
        private int _id;
        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        private ConcurrentDictionary<string, GamePlayer> _players
            = new ConcurrentDictionary<string, GamePlayer>();

        public void AddPlayer(GamePlayer player)
        {
            _players[player.Name] = player;
        }

        public void RemovePlayer(GamePlayer player)
        {
            _players.TryRemove(player.Name, out player);
        }
    }
}
