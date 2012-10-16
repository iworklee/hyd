using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Command;
using Google.ProtocolBuffers;

namespace Action.Engine
{
    public abstract class GameCommandBase : CommandBase<GameSession, BinaryCommandInfo>
    {
        //protected GameCommandBase()
        //    : base()
        //{
        //    var type = this.GetType();
        //    var attr = Attribute.GetCustomAttribute(type, typeof(GameCommandAttribute));
        //    if (attr == null)
        //        _name = null;
        //    else
        //        _name = ((GameCommandAttribute)attr).CommandId.ToString();
        //}

        //private string _name;
        //public override string Name
        //{
        //    get { return _name; }
        //}

        protected virtual int CD
        {
            get { return 0; }
        }

        public override void ExecuteCommand(GameSession session, BinaryCommandInfo commandInfo)
        {
            //TODO:CD验证

            //TODO:执行命令
            Execute(session, commandInfo);

            //TODO:记录命令
        }

        protected abstract void Execute(GameSession session, BinaryCommandInfo commandInfo);

        public override string ToString()
        {
            var type = this.GetType();
            var attr = Attribute.GetCustomAttribute(type, typeof(GameCommandAttribute));
            if (attr == null)
                return Name;
            else
                return string.Format("{0}({1})", Name, ((GameCommandAttribute)attr).CommandId);
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
            return true;
        }

        protected abstract void Run(GameSession session);
    }

    public abstract class GameCommand<T> : GameCommandBase
    {
        protected override void Execute(GameSession session, BinaryCommandInfo commandInfo)
        {
            var data = (T)Deserialize(commandInfo.Data);
            if (Ready(session, data))
                Run(session, data);
        }

        private object Deserialize(byte[] data)
        {
            if (typeof(T) == typeof(int))
                return BitConverter.ToInt32(data, 0);
            return null;
        }

        protected virtual bool Ready(GameSession session, T data)
        {
            return true;
        }

        protected abstract void Run(GameSession session, T data);
    }
}
