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

namespace Action.Login
{
    [Export(typeof(IGameModule))]
    public class LoginModule : IGameModule
    {
        public void Load(GameWorld world)
        {
            LogUtil.LogInfo("LoginModule loaded.");

            var tblPlayer = world.GetDbCollection<Player>(DbCollectionDef.Player.Name);
            tblPlayer.CreateIndex(DbCollectionDef.Player.Key);

            var tblAccount = world.GetDbCollection<Account>(DbCollectionDef.Account.Name);
            tblAccount.CreateIndex(DbCollectionDef.Account.Key);
        }

        public void Unload(GameWorld world)
        {
            LogUtil.LogInfo("LoginModule unloaded.");
        }

        public void EnterGame(GamePlayer player)
        {
        }

        public void LeaveGame(GamePlayer player)
        {            
        }
    }
}
