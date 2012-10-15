using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Protocol;
using SuperSocket.SocketBase.Command;
using SuperSocket.SocketBase;

namespace Action.Engine
{
    public class GameProtocol : ICustomProtocol<BinaryCommandInfo>
    {
        //public ICommandReader<BinaryCommandInfo> CreateCommandReader(IAppServer appServer)
        //{
        //    return new WebSocketHeaderReader(appServer as IWebSocketServer);
        //}

        #region ICustomProtocol<BinaryCommandInfo> 成员

        public ICommandReader<BinaryCommandInfo> CreateCommandReader(IAppServer appServer)
        {
            throw new NotImplementedException();
        }

        #endregion
    }
}
