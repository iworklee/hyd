using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Command;
using Google.ProtocolBuffers;

namespace Action.Engine
{
    public class GameCommand : CommandBase<GameSession,BinaryCommandInfo>
    {
        public override string Name
        {
            get
            {
                return base.Name;
            }
        }

        public override void ExecuteCommand(GameSession session, BinaryCommandInfo commandInfo)
        {
            throw new NotImplementedException();
        } 
    }

    //public class GameCommand<TProtobuf> : CommandBase<GameSession, BinaryCommandInfo>
    //{
    //    public override void ExecuteCommand(GameSession session, BinaryCommandInfo commandInfo)
    //    {
    //        throw new NotImplementedException();
    //        //commandInfo.
    //        //GeneratedBuilder<TProtobuf, Builder> 
    //    }
    //}
}
