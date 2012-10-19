using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.Composition;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using Action.Engine;
using Action.Model;

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
            //从场景中移除玩家
            session.AppServer.World.GetScene(session.Player.SceneId)
                .RemovePlayer(session.Player);

            //保存玩家所在的场景和位置
            var tblPlayer = session.AppServer.DefaultDatabase
                .GetCollection<Player>(DbCollectionDef.Player.Name);
            var player = tblPlayer.AsQueryable().Where(p => p.Name == session.Player.Name).FirstOrDefault();
            tblPlayer.Save(player);
        }
    }
}
