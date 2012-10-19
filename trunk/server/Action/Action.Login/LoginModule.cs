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
        public void OnStartup(GameServer server)
        {
            LogUtil.LogInfo("LoginModule loaded.");

            var tblPlayer = server.DefaultDatabase.GetCollection(DbCollectionDef.Player.Name);
            tblPlayer.CreateIndex(DbCollectionDef.Player.Key);

            var tblAccount = server.DefaultDatabase.GetCollection(DbCollectionDef.Account.Name);
            tblAccount.CreateIndex(DbCollectionDef.Account.Key);
        }

        public void OnStopped(GameServer server)
        {
            LogUtil.LogInfo("LoginModule unloaded.");
        }

        public void OnAppSessionClosed(GameSession session)
        {
            
        }
    }
}
