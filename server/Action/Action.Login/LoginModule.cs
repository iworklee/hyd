using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;
using System.ComponentModel.Composition;
using Action.Core;
using SuperSocket.Common;

namespace Action.Login
{
    [Export(typeof(IGameModule))]
    public class LoginModule : GameModule
    {
        public override void Load(GameServer server)
        {
            LogUtil.LogInfo("LoginModule loaded.");
            //TestHelper.WriteLine("LoginModule loaded.");
        }

        public override void Unload(GameServer server)
        {
            LogUtil.LogInfo("LoginModule unloaded.");
            //TestHelper.WriteLine("LoginModule unloaded.");
        }
    }
}
