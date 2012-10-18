using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using Action.Model;
using Action.Engine;

namespace Action.Role.Commands
{
    [GameCommand((int)CommandEnum.ViewBasicPropCommand)]
    public class ViewBasicPropCommand : GameCommand<string>
    {
        protected override void Run(GameSession session, string args)
        {
            var name = string.IsNullOrEmpty(args) ? session.Player.Name : args;
        }
    }
}
