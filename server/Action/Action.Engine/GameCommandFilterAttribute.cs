using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase;
using SuperSocket.SocketBase.Command;

namespace Action.Engine
{
    public abstract class GameCommandFilterAttribute : CommandFilterAttribute
    {
        //public override void OnCommandExecuting(IAppSession session, ICommand command)
        //{
        //    OnCommandExecuting(session as GameSession, command as GameCommandBase);
        //}

        //public override void OnCommandExecuted(IAppSession session, ICommand command)
        //{
        //    OnCommandExecuted(session as GameSession, command as GameCommandBase);
        //}

        public override void OnCommandExecuting(CommandExecutingContext commandContext)
        {
            OnCommandExecuting(commandContext.Session as GameSession, commandContext.CurrentCommand as GameCommandBase);
        }

        public override void OnCommandExecuted(CommandExecutingContext commandContext)
        {
            OnCommandExecuted(commandContext.Session as GameSession, commandContext.CurrentCommand as GameCommandBase);
        }

        public abstract void OnCommandExecuted(GameSession session, GameCommandBase command);
        public abstract void OnCommandExecuting(GameSession session, GameCommandBase command);
    }
}
