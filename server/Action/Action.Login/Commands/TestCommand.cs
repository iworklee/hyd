using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.Composition;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using Action.Engine;
using Action.Model;
using Action.DataAccess;

namespace Action.Login.Commands
{
    [GameCommand(0)]
    public class TestCommand : GameCommand
    {
        protected override bool Ready(GameSession session)
        {
            return true;
        }

        protected override void Run(GameSession session)
        {
            
        }
    }
}
