using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Protocol;
using SuperSocket.SocketBase.Command;
using SuperSocket.SocketBase;

namespace Action.Engine
{
    public class GameCommandHeaderReader : IReceiveFilter<BinaryRequestInfo>
    {
        private byte[] _buffer = new byte[8];
        private int _currentReceived = 0;

        //private int cmdId = 0;
        //private int dataLen = 0;

        private readonly IAppServer _appServer;
        private readonly GameCommandDataReader _dataReader;

        public int LeftBufferSize { get { return _currentReceived; } }

        public IReceiveFilter<BinaryRequestInfo> NextReceiveFilter { get; private set; }

        public FilterState State
        {
            get { return FilterState.Normal; }
        }

        public GameCommandHeaderReader(IAppServer appServer)
        {
            _appServer = appServer;
            _dataReader = new GameCommandDataReader(this);
        }

        public void Reset()
        {
            _currentReceived = 0;
        }

        public BinaryRequestInfo Filter(byte[] readBuffer, int offset, int length, bool toBeCopied, out int rest)
        {
            NextReceiveFilter = this;

            rest = 0;

            if (_currentReceived + length <= _buffer.Length)
            {
                Array.Copy(readBuffer, offset, _buffer, _currentReceived, length);
                _currentReceived += length;

                if (_currentReceived < _buffer.Length)
                    return null;
            }
            else
            {
                Array.Copy(readBuffer, offset, _buffer, _currentReceived, _buffer.Length - _currentReceived);
                rest = length - (_buffer.Length - _currentReceived);
            }

            _currentReceived = 0;

            int cmdId = BitConverter.ToInt32(_buffer, 0);
            int dataLen = BitConverter.ToInt32(_buffer, 4);

            BinaryRequestInfo cmdInfo;
            if (dataLen > 0)
            {
                _dataReader.CommandId = cmdId;
                _dataReader.DataLength = dataLen;

                cmdInfo = _dataReader.Filter(readBuffer, offset + (length - rest), rest, toBeCopied, out rest);
                NextReceiveFilter = _dataReader.NextReceiveFilter;
            }
            else
            {
                cmdInfo = new BinaryRequestInfo(cmdId.ToString(), null);
            }
            return cmdInfo;
        }

        //public BinaryRequestInfo FindCommandInfo(IAppSession session, byte[] readBuffer, int offset, int length, bool isReusableBuffer, out int left)
        //{
        //    NextCommandReader = this;

        //    left = 0;

        //    if (currentReceived + length <= buffer.Length)
        //    {
        //        Array.Copy(readBuffer, offset, buffer, currentReceived, length);
        //        currentReceived += length;

        //        if (currentReceived < buffer.Length)
        //            return null;
        //    }
        //    else
        //    {
        //        Array.Copy(readBuffer, offset, buffer, currentReceived, buffer.Length - currentReceived);
        //        left = length - (buffer.Length - currentReceived);
        //    }

        //    currentReceived = 0;

        //    cmdId = BitConverter.ToInt32(buffer, 0);
        //    dataLen = BitConverter.ToInt32(buffer, 4);

        //    BinaryRequestInfo cmdInfo;
        //    if (dataLen > 0)
        //    {
        //        DataReader.CommandId = cmdId;
        //        DataReader.DataLength = dataLen;

        //        cmdInfo = DataReader.FindCommandInfo(session, readBuffer, offset + (length - left), left, isReusableBuffer, out left);
        //        NextCommandReader = DataReader.NextCommandReader;
        //    }
        //    else
        //    {
        //        cmdInfo = new BinaryRequestInfo(cmdId.ToString(), null);
        //    }
        //    return cmdInfo;

        //    #region UNDONE ProtocolBuffer
        //    /*   
        //    switch (currentIndex)
        //    {
        //        case 0:
        //            tmp = readBuffer[offset];
        //            if (tmp < 128)
        //                cmdId = tmp;
        //            else
        //                cmdId = tmp & 0x7f;

        //            break;
        //        case 1:
        //            tmp = readBuffer[offset + 1];
        //            if (tmp < 128)
        //                cmdId |= tmp << 7;
        //            else
        //                cmdId |= (tmp & 0x7f) << 7;

        //            break;
        //        case 2:
        //            tmp = readBuffer[offset + 2];
        //            if (tmp < 128)
        //                cmdId |= tmp << 14;
        //            else
        //                cmdId |= (tmp & 0x7f) << 14;

        //            break;
        //        case 3:
        //            tmp = readBuffer[offset + 3];
        //            if (tmp < 128)
        //                cmdId |= tmp << 21;
        //            else
        //                cmdId |= (tmp & 0x7f) << 21;

        //            break;
        //        case 4:
        //            tmp = readBuffer[offset + 4];
        //            if (tmp < 128)
        //                cmdId |= tmp << 28;
        //            else
        //            {
        //                AppServer.Logger.LogError(session, "Invalid ProtocolBuffer Data - Malformed Varint");
        //                session.Close(CloseReason.ServerClosing);
        //            }

        //            break;
        //    }
        //    */
        //    #endregion

        //}


    }
}

