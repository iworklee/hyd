using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.Composition;
using SuperSocket.Common;
using MongoDB.Driver;
using Action.Engine;
using Action.Core;
using Action.Model;
using MongoDB.Driver.Builders;

namespace Action.Login
{
    [Export(typeof(IGameModule))]
    public class LoginModule : IGameModule
    {
        public void Load(GameWorld world)
        {
            var db = world.AppServer.DefaultDatabase;

            var tblPlayer = db.GetCollection<Player>(DbCollectionDef.Player.Name);
            tblPlayer.EnsureIndex(IndexKeys.Ascending(DbCollectionDef.Player.Key),
                IndexOptions.SetUnique(true));

            var tblAccount = db.GetCollection<Account>(DbCollectionDef.Account.Name);
            tblAccount.EnsureIndex(IndexKeys.Ascending(DbCollectionDef.Account.Key),
                IndexOptions.SetUnique(true));
        }

        public void Unload(GameWorld world)
        {
            
        }

        public void EnterGame(GamePlayer player)
        {
        }

        public void LeaveGame(GamePlayer player)
        {            
        }
    }
}
