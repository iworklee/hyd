using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Command;

namespace Action.Engine
{
    public class ECHO : StringCommandBase<GameSession>
    {
        #region CommandBase<EchoSession> Members

        public override void ExecuteCommand(GameSession session, StringCommandInfo commandInfo)
        {
            session.SendResponse(commandInfo.Data);
        }

        #endregion
    }
}
