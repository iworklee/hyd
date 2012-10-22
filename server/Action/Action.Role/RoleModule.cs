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
            var dbPlayers = player.Session.AppServer.DefaultDatabase
                .GetCollection<Player>().AsQueryable();
            var dbPlayer = dbPlayers.Where(p => p.Name == player.Name).FirstOrDefault();
            if (dbPlayer != null)
                player.Right.Reset(dbPlayer.Right.Items);
        }

        public void LeaveGame(GamePlayer player)
        {
        }
    }
}
