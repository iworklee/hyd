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

namespace Action.Role
{
    [Export(typeof(IGameModule))]
    public class RoleModule : IGameModule
    {
        public void Load(GameWorld world)
        {
            
        }

        public void Unload(GameWorld world)
        {
            
        }

        public void EnterGame(GamePlayer player)
        {
            var players = player.Session.AppServer.DefaultDatabase
                .GetCollection<Player>(DbCollectionDef.Player.Name).AsQueryable();
            var ply = players.Where(p => p.Name == player.Name).FirstOrDefault();
            if (ply != null)
            {
                
            }
        }

        public void LeaveGame(GamePlayer player)
        {
            
        }
    }
}
