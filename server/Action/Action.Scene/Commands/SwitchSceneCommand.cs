using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using Action.Model;
using Action.Engine;

namespace Action.Scene.Commands
{
    [GameCommand((int)CommandEnum.SwitchScene)]
    public class SwitchSceneCommand : GameCommand<int>
    {
        protected override void Run(GameSession session, int args)
        {
            if (session.Player.World.SwitchScene(session.Player, args))
                session.SendResponse(CommandID, args);
        }
    }
}
