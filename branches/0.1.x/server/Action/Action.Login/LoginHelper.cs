using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;
using Action.Model;

namespace Action.Login
{
    static class LoginHelper
    {
        public static void EnterGame(GameSession session, Player player)
        {
            session.Player.SceneId = player.SceneId;
            session.Player.Position = player.Position;
            if (player.Role != null)
            {
                session.Player.Display.Job = player.Role.Job;
                session.Player.Display.Sex = player.Role.Sex;
                session.Player.Display.Skin = player.Role.Skin;
            }
            session.EnterGame(player.Name);
            session.SendResponse((int)CommandEnum.EnterGame);
        }
    }
}
