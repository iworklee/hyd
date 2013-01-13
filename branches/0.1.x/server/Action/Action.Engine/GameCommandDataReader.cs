using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Protocol;
using SuperSocket.SocketBase.Command;
using SuperSocket.SocketBase;

namespace Action.Engine
{
    public class GameCommandDataReader : CommandReaderBase<BinaryCommandInfo>
    {
        public int CommandId { get; set; }
        public int DataLength { get; set; }

        public ICommandReader<BinaryCommandInfo> PrevCommandReader { get; private set; }

        public GameCommandDataReader(ICommandReader<BinaryCommandInfo> previousCommandReader)
            : base(previousCommandReader.AppServer)
        {
            PrevCommandReader = previousCommandReader;
        }
        public override BinaryCommandInfo FindCommandInfo(IAppSession session, byte[] readBuffer, int offset, int length, bool isReusableBuffer, out int left)
        {
            NextCommandReader = this;
            left = 0;
            if (LeftBufferSize + length <= DataLength)
            {
                AddArraySegment(readBuffer, offset, length, isReusableBuffer);

                if (LeftBufferSize < DataLength)
                    return null;
            }
            else
            {
                AddArraySegment(readBuffer, offset, DataLength - LeftBufferSize, false);
                left = length - (DataLength - LeftBufferSize);
            }
            NextCommandReader = PrevCommandReader;

            var cmdInfo = new BinaryCommandInfo(CommandId.ToString(), BufferSegments.ToArrayData());

            ClearBufferSegments();

            return cmdInfo;
        }
    }
}
