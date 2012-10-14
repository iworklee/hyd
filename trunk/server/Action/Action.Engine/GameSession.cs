using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase;

namespace Action.Engine
{
    public class GameSession : AppSession<GameSession>
    {
        public override void StartSession()
        {
            SendResponse("Welcome to EchoServer!");
        }

        public override void HandleExceptionalError(Exception e)
        {
            SendResponse("Server side error occurred!");
        }
    }
}
