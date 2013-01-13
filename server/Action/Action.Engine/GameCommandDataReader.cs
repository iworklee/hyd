using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Protocol;
using SuperSocket.SocketBase.Command;
using SuperSocket.SocketBase;

namespace Action.Engine
{
    public class GameCommandDataReader : ReceiveFilterBase<BinaryRequestInfo>
    {
        public int CommandId { get; set; }
        public int DataLength { get; set; }

        public IReceiveFilter<BinaryRequestInfo> PrevReceiveFilter { get; private set; }

        public GameCommandDataReader(IReceiveFilter<BinaryRequestInfo> previousCommandReader)
            : base()
        {
            this.PrevReceiveFilter = previousCommandReader;
        }
        //public override BinaryRequestInfo FindCommandInfo(IAppSession session, byte[] readBuffer, int offset, int length, bool isReusableBuffer, out int left)
        //{
        //    NextCommandReader = this;
        //    left = 0;
        //    if (LeftBufferSize + length <= DataLength)
        //    {
        //        AddArraySegment(readBuffer, offset, length, isReusableBuffer);

        //        if (LeftBufferSize < DataLength)
        //            return null;
        //    }
        //    else
        //    {
        //        AddArraySegment(readBuffer, offset, DataLength - LeftBufferSize, false);
        //        left = length - (DataLength - LeftBufferSize);
        //    }
        //    NextCommandReader = PrevCommandReader;

        //    var cmdInfo = new BinaryRequestInfo(CommandId.ToString(), BufferSegments.ToArrayData());

        //    ClearBufferSegments();

        //    return cmdInfo;
        //}

        public override BinaryRequestInfo Filter(byte[] readBuffer, int offset, int length, bool toBeCopied, out int rest)
        {
            NextReceiveFilter = this;
            rest = 0;
            if (LeftBufferSize + length <= DataLength)
            {
                AddArraySegment(readBuffer, offset, length, toBeCopied);

                if (LeftBufferSize < DataLength)
                    return null;
            }
            else
            {
                AddArraySegment(readBuffer, offset, DataLength - LeftBufferSize, false);
                rest = length - (DataLength - LeftBufferSize);
            }
            NextReceiveFilter = PrevReceiveFilter;

            var cmdInfo = new BinaryRequestInfo(CommandId.ToString(), BufferSegments.ToArrayData());

            ClearBufferSegments();

            return cmdInfo;
        }
    }
}
