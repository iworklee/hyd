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
    [GameCommand((int)CommandEnum.Move)]
    public class MoveCommand : GameCommand<MoveArgs>
    {
        protected override void Run(GameSession session, MoveArgs args)
        {
            if (session.Player.Position.X != args.X || session.Player.Position.Y != args.Y)
            {
                session.Player.MoveTo(args.X, args.Y);
                var responseArgs = GetResponseArgs(session.Player, args);
                foreach (var player in session.Player.GetScene().GetPlayers())
                    player.Session.SendResponse<PlayerMoveArgs>(ID, responseArgs);
            }
        }

        private PlayerMoveArgs GetResponseArgs(GamePlayer player, MoveArgs args)
        {
            var responseArgs = new PlayerMoveArgs();
            responseArgs.Name = player.Name;
            responseArgs.X = args.X;
            responseArgs.Y = args.Y;
            return responseArgs;
        }
    }
}
