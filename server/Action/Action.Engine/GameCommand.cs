using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Command;

namespace Action.Engine
{
    public abstract class GameCommandBase : CommandBase<GameSession, BinaryCommandInfo>
    {
        protected GameCommandBase()
        {
            var type = this.GetType();
            name = type.Name;

            var attr = Attribute.GetCustomAttribute(type, typeof(GameCommandAttribute));
            if (attr == null)
                cmdId = 0;
            else
                cmdId = ((GameCommandAttribute)attr).CommandId;
        }

        private string name;
        public override string Name { get { return name; } }
        private int cmdId;
        public int CommandId { get { return cmdId; } }

        protected virtual int CD
        {
            get { return 0; }
        }

        public override void ExecuteCommand(GameSession session, BinaryCommandInfo commandInfo)
        {
            //TODO:CD验证
            if (CD > 0 && session.CommandLogger.IsCommandInCD(CommandId, CD))
                return;

            //TODO:执行命令
            Execute(session, commandInfo);

            //TODO:记录命令
            session.CommandLogger.LogCommand(CommandId, commandInfo);
        }

        protected abstract void Execute(GameSession session, BinaryCommandInfo commandInfo);

        public override string ToString()
        {
            return string.Format("{0}({1})", Name, CommandId);
        }
    }

    public abstract class GameCommand : GameCommandBase
    {
        protected override void Execute(GameSession session, BinaryCommandInfo commandInfo)
        {
            if (Ready(session))
                Run(session);
        }

        protected virtual bool Ready(GameSession session)
        {
            return session.Enabled;
        }

        protected abstract void Run(GameSession session);
    }

    public abstract class GameCommand<T> : GameCommandBase
    {
        protected override void Execute(GameSession session, BinaryCommandInfo commandInfo)
        {
            var args = GameCommandDataDeserializer.Deserialize<T>(commandInfo.Data);
            if (Ready(session, args))
                Run(session, args);
        }

        protected virtual bool Ready(GameSession session, T args)
        {
            return session.Enabled && session.Player.IsOnline;
        }

        protected abstract void Run(GameSession session, T args);
    }
}
