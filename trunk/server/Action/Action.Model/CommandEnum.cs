using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Model
{
    public enum CommandEnum
    {
        //Login
        BackdoorLogin = 1000,
        TencentOpenLogin,
        CreateRole = 1010,
        EnterGame = 1011,

        //Role
        ViewRoleInfo = 1100,
        ViewBasicPropCommand = 1101,

        //Scene
        SnapPlayers = 1200,
        Move = 1201,
        SwitchScene = 1202,

        //Chat
        TalkToWorld = 1300,

        //War
        Embattle = 1400,
    }
}
