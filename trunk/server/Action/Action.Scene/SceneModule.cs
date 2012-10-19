using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.Composition;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using Action.Engine;
using Action.Model;
using MongoDB.Driver.Builders;

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

            //保存方案1：可能性能不行
            //var player = tblPlayer.AsQueryable().Where(p => p.Name == session.Player.Name)
            //    .FirstOrDefault();
            //if (player != null)
            //{
            //    player.SceneId = session.Player.SceneId;
            //    player.Position = session.Player.Position;
            //    tblPlayer.Save(player);
            //}

            //保存方案2
            var query = Query<Player>.Where(p => p.Name == session.Player.Name);
            var update = Update<Player>
                .Set(p => p.SceneId, session.Player.SceneId)
                .Set(p => p.Position, session.Player.Position);
            tblPlayer.Update(query, update);
        }
    }
}
