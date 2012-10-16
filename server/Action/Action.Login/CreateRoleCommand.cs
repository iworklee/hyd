using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;
using Action.Model.Protobuf;

namespace Action.Login
{
    [GameCommand(1002)]
    public class CreateRoleCommand : GameCommand<CreateRoleArgs>
    {
        protected override void Run(GameSession session, CreateRoleArgs args)
        {
            
        }
    }
}
