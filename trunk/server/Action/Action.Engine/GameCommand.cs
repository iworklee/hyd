using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Command;
using Google.ProtocolBuffers;

namespace Action.Engine
{
    public abstract class GameCommand : CommandBase<GameSession, BinaryCommandInfo>
    {
        protected GameCommand()
            : base()
        {
            var type = this.GetType();
            var attr = Attribute.GetCustomAttribute(type, typeof(GameCommandAttribute));
            if (attr == null)
                name = null;
            else
                name = ((GameCommandAttribute)attr).CommandId.ToString();
        }

        private string name;
        public override string Name { get { return name; } }
    }

    public abstract class GameCommand<TProtobuf> : GameCommand
    {
        public override void ExecuteCommand(GameSession session, BinaryCommandInfo commandInfo)
        {
            CodedInputStream.CreateInstance(commandInfo.Data);
            ExecuteCommand(session, default(TProtobuf));
        }

        public abstract void ExecuteCommand(GameSession session, TProtobuf data);

    }
}
