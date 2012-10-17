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
            session.Player.IsOnline = true;
            session.SendResponse((int)CommandEnum.EnterGame);
        }
    }
}
