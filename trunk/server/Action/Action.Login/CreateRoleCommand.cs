using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;
using Action.Model.Protobuf;
using Action.Model;

namespace Action.Login
{
    [GameCommand((int)CommandEnum.CreateRole)]
    public class CreateRoleCommand : GameCommand<CreateRoleArgs>
    {
        protected override void Run(GameSession session, CreateRoleArgs args)
        {
            
        }
    }
}
