using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.Composition;
using Action.Engine;

namespace Action.Scene
{
    [Export(typeof(IGameModule))]
    public class SceneModule : IGameModule
    {
        public void OnStartup(GameServer server)
        {
            
        }

        public void OnStopped(GameServer server)
        {
            
        }

        public void OnAppSessionClosed(GameSession session)
        {
            session.AppServer.World.GetScene(session.Player.SceneId)
                .RemovePlayer(session.Player);
        }
    }
}
