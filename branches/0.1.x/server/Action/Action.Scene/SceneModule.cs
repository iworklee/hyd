using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.Composition;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using MongoDB.Driver.Builders;
using Action.Engine;
using Action.Model;
using Action.DataAccess;

namespace Action.Scene
{
    [Export(typeof(IGameModule))]
    public class SceneModule : IGameModule
    {
        [Import]
        private MongoDataAccess mongoDB = null;

        public void Load(GameWorld world)
        {

        }

        public void Unload(GameWorld world)
        {

        }

        public void EnterGame(GamePlayer player)
        {
            player.Scene.AddPlayer(player);
        }

        public void LeaveGame(GamePlayer player)
        {
            player.Scene.RemovePlayer(player);

            //保存玩家所在的场景和位置
            var tblPlayer = mongoDB.DefaultDatabase
                .GetCollection<Player>();
            var query = Query<Player>.Where(p => p.Name == player.Name);
            var update = Update<Player>
                .Set(p => p.SceneId, player.SceneId)
                .Set(p => p.Position, player.Position);
            tblPlayer.Update(query, update);
        }
    }
}
