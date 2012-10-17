using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Engine;
using Action.Model.Mongodb;
using Action.Model;

namespace Action.Login
{
    static class LoginHelper
    {
        public static void EnterGame(GameSession session, Player player)
        {
            session.Player.IsOnline = true;
            session.Player.Name = player.Name;
            session.Player.Job = player.Job;
            session.Player.Sex = (int)player.Sex;
            session.SendResponse((int)CommandEnum.EnterGame);
        }
    }
}
