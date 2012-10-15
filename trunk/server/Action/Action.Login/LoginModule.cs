using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;
using System.ComponentModel.Composition;
using Action.Core;

namespace Action.Login
{
    [Export(typeof(IGameModule))]
    public class LoginModule : GameModule
    {
        public override void Load(GameServer server)
        {
            TestHelper.WriteLine("LoginModule loaded.");
        }

        public override void Unload(GameServer server)
        {
            TestHelper.WriteLine("LoginModule unloaded.");
        }
    }
}
