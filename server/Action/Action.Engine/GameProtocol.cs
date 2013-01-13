using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Protocol;
using SuperSocket.SocketBase.Command;
using SuperSocket.SocketBase;

namespace Action.Engine
{
    public class GameProtocol : IReceiveFilterFactory<BinaryRequestInfo>
    {
        //public ICommandReader<BinaryRequestInfo> CreateCommandReader(IAppServer appServer)
        //{
        //    return new GameCommandHeaderReader(appServer);
        //}

        public IReceiveFilter<BinaryRequestInfo> CreateFilter(IAppServer appServer, IAppSession appSession, System.Net.IPEndPoint remoteEndPoint)
        {
            return new GameCommandHeaderReader(appServer);
        }
    }
}
