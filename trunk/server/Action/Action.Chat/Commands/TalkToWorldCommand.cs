using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using Action.Model;
using Action.Engine;

namespace Action.Chat.Commands
{
    [GameCommand((int)CommandEnum.TalkToWorld)]
    public class TalkToWorldCommand : GameCommand<string>
    {
        protected override void Run(GameSession session, string args)
        {
            throw new NotImplementedException();
        }
    }
}
