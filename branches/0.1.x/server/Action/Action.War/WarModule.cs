using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.Composition;
using SuperSocket.Common;
using MongoDB.Driver;
using MongoDB.Driver.Builders;
using Action.Engine;
using Action.DataAccess;
using Action.Model;

namespace Action.War
{
    [Export(typeof(IGameModule))]
    public class WarModule : IGameModule
    {
        public void Load(GameWorld world)
        {
            
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
