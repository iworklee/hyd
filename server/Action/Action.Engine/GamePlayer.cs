using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;

namespace Action.Engine
{
    public class GamePlayerDisplay
    {
        public int Job { get; set; }
        public int Sex { get; set; }
        public int Skin { get; set; }
    }

    public class GamePlayerRight
    {
        private List<int> _funIds = new List<int>();

        public void Add(int funId)
        {
            if (!_funIds.Contains(funId))
                _funIds.Add(funId);
        }

        public void Remove(int funId)
        {
            if (_funIds.Contains(funId))
                _funIds.Remove(funId);
        }

        public void Reset(IEnumerable<int> funIds)
        {
            _funIds.Clear();
            _funIds.AddRange(funIds);
        }

        public bool Contains(int funId)
        {
            return _funIds.Contains(funId);
        }
    }

    public class GamePlayer
    {
        private GameSession _session;
        public GameSession Session
        {
            get { return _session; }
        }

        private GamePlayerDisplay _display = new GamePlayerDisplay();
        public GamePlayerDisplay Display
        {
            get { return _display; }
            set { _display = value; }
        }

        private GamePlayerRight _right = new GamePlayerRight();
        public GamePlayerRight Right
        {
            get { return _right; }
            set { _right = value; }
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

        public GameWorld World
        {
            get { return _session.AppServer.World; }
        }

        public GameScene Scene
        {
            get { return World.GetScene(SceneId); }
        }

        public void MoveTo(int x, int y)
        {
            Position = new Vector2(x, y);
        }
    }
}
