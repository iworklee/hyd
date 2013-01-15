using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Command;
using SuperSocket.Common;
using SuperSocket.SocketBase.Protocol;

namespace Action.Engine
{
    public abstract class GameCommandBase : CommandBase<GameSession, BinaryRequestInfo>
    {
        protected GameCommandBase()
        {
            var type = this.GetType();
            CommandName = type.Name;

            var attr = Attribute.GetCustomAttribute(type, typeof(GameCommandAttribute));
            if (attr == null)
                CommandID = 0;
            else
                CommandID = ((GameCommandAttribute)attr).CommandId;
        }

        public override string Name { get { return CommandID.ToString(); } }

        public int CommandID { get; private set; }
        public string CommandName { get; private set; }

        protected virtual int CD
        {
            get { return 0; }
        }

        protected virtual bool CheckRight
        {
            get { return false; }
        }

        public override void ExecuteCommand(GameSession session, BinaryRequestInfo commandInfo)
        {
            //TODO:权限认证
            if (CheckRight && !session.Player.Right.Contains(CommandID))
                return;

            //TODO:CD验证
            if (CD > 0 && session.CommandLogger.IsCommandInCD(CommandID, CD))
                return;

            //TODO:执行命令
            Execute(session, commandInfo);

            //TODO:记录命令
            session.CommandLogger.LogCommand(CommandID, commandInfo);
        }

        protected abstract void Execute(GameSession session, BinaryRequestInfo commandInfo);

        public override string ToString()
        {
            return string.Format("{0}({1})", CommandName, CommandID);
        }
    }

    public abstract class GameCommand : GameCommandBase
    {
        protected override void Execute(GameSession session, BinaryRequestInfo commandInfo)
        {
            if (Ready(session))
                Run(session);
        }

        protected virtual bool Ready(GameSession session)
        {
            return session.Opened;
        }

        protected abstract void Run(GameSession session);
    }

    public abstract class GameCommand<T> : GameCommandBase
    {
        protected override void Execute(GameSession session, BinaryRequestInfo commandInfo)
        {
            T args;
            try
            {
                // UNDONE 对象池取args实例
                args = GameCommandDataDeserializer.Deserialize<T>(commandInfo.Body);
            }
            catch (Exception ex)
            {
                //args = default(T);
                //Logger.Error(string.Format("{0} cannot deserialize data to {1}", this.ToString(), typeof(T).FullName), ex);
                session.Close();
                return;
            }
            if (Ready(session, args))
                Run(session, args);

            // UNDONE 对象池回收args实例
        }

        protected virtual bool Ready(GameSession session, T args)
        {
            return session.Opened && session.Player.IsOnline;
        }

        protected abstract void Run(GameSession session, T args);
    }
}
