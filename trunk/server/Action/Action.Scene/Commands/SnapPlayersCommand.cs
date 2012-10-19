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
    [GameCommand((int)CommandEnum.SnapPlayers)]
    public class SnapPlayersCommand : GameCommand
    {
        protected override void Run(GameSession session)
        {
            var argsColl = new SnapPlayerArgsCollection();
            foreach (var player in session.Player.GetScene().GetPlayers())
            {
                var args = new SnapPlayerArgs();
                args.Name = player.Name;
                args.Job = player.Display.Job;
                args.Sex = player.Display.Sex;
                args.Skin = player.Display.Skin;
                args.X = (int)player.Position.X;
                args.Y = (int)player.Position.Y;
                argsColl.Items.Add(args);
            }
            session.SendResponse<SnapPlayerArgsCollection>(ID, argsColl);
        }
    }
}
