using System;
using System.Collections.Generic;
using System.Collections.Concurrent;
using System.Linq;
using System.Text;

namespace Action.Engine
{
    public class GameWorld
    {
        private GameScene _defaultScene = new GameScene();

        private ConcurrentDictionary<int, GameScene> _scenes
            = new ConcurrentDictionary<int, GameScene>();

        private ConcurrentDictionary<string, GamePlayer> _onlinePlayers
            = new ConcurrentDictionary<string, GamePlayer>();

        private GameServer _appServer;
        public GameServer AppServer
        {
            get { return _appServer; }
        }

        public GameWorld(GameServer server)
        {
            _appServer = server;
            _scenes[0] = _defaultScene;
        }

        public void AddScene(GameScene scene)
        {
            _scenes[scene.Id] = scene;
        }

        public GameScene GetScene(int sceneId)
        {
            GameScene scene = null;
            if (_scenes.TryGetValue(sceneId, out scene))
                return scene;
            return _defaultScene;
        }

        public bool SwitchScene(GamePlayer player, int targetSceneId)
        {
            if (player.SceneId != targetSceneId)
            {
                var sourceScene = GetScene(player.SceneId);
                var targetScene = GetScene(targetSceneId);
                if (sourceScene != null && targetScene != null)
                {
                    player.SceneId = targetSceneId;
                    sourceScene.RemovePlayer(player);
                    targetScene.AddPlayer(player);
                    return true;
                }
            }
            return false;
        }

        public void AddPlayer(GamePlayer player)
        {
            _onlinePlayers[player.Name] = player;
        }

        public void RemovePlayer(GamePlayer player)
        {
            _onlinePlayers.TryRemove(player.Name, out player);
        }

        public IEnumerable<GamePlayer> GetOnlinePlayers()
        {
            return _onlinePlayers.Values;
        }

        public GamePlayer GetOnlinePlayer(string name)
        {
            GamePlayer player = null;
            if (_onlinePlayers.TryGetValue(name, out player))
                return player;
            return null;
        }
    }
}
