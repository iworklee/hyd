using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase;
using SuperSocket.SocketBase.Command;
using System.IO;
using ProtoBuf;

namespace Action.Engine
{
    public class GameSession : AppSession<GameSession, BinaryCommandInfo>
    {
        public new GameServer AppServer
        {
            get { return (GameServer)base.AppServer; }
        }

        public override void StartSession()
        {
            // TODO 用户会话
        }

        private string _account;
        public string Account
        {
            get { return _account; }
        }

        private bool _enabled;
        public bool Enabled
        {
            get { return _enabled; }
        }

        public void Bind(string account)
        {
            _account = account;
            _enabled = true;
        }


        /// <summary>
        /// Only send cmdId, no data, package size is 0
        /// </summary>
        /// <param name="commandId"></param>
        public void SendResponse(int commandId)
        {
            SendResponse(BitConverter.GetBytes(commandId));
            SendResponse(BitConverter.GetBytes(0));
        }

        /// <summary>
        /// Send cmdId and protobuf data
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="commandId"></param>
        /// <param name="data"></param>
        public void SendResponse<T>(int commandId, T data)
        {
            SendResponse(BitConverter.GetBytes(commandId));
            using (var ms = new MemoryStream())
            {
                Serializer.Serialize<T>(ms, data);
                SendResponse(BitConverter.GetBytes(ms.Length));
                SendResponse(ms.ToArray());
            }
        }

        public void SendResponse(int commandId, bool data)
        {
            SendResponse(BitConverter.GetBytes(commandId));
            SendResponse(BitConverter.GetBytes(1));
            SendResponse(BitConverter.GetBytes(data));
        }

        public void SendResponse(int commandId, int data)
        {
            SendResponse(BitConverter.GetBytes(commandId));
            SendResponse(BitConverter.GetBytes(4));
            SendResponse(BitConverter.GetBytes(data));
        }

        public void SendResponse(int commandId, float data)
        {
            SendResponse(BitConverter.GetBytes(commandId));
            SendResponse(BitConverter.GetBytes(4));
            SendResponse(BitConverter.GetBytes(data));
        }

        public void SendResponse(int commandId, string data)
        {
            SendResponse(BitConverter.GetBytes(commandId));
            byte[] bytes = Encoding.UTF8.GetBytes(data);
            SendResponse(BitConverter.GetBytes(bytes.Length));
            SendResponse(bytes);
        }
    }
}
