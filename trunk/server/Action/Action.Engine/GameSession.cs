using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase;
using SuperSocket.SocketBase.Command;
using System.IO;
using ProtoBuf;
using MongoDB.Driver;
using System.Configuration;

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

        private bool _opened;
        public bool Opened
        {
            get { return _opened; }
        }

        private GamePlayer _player;
        public GamePlayer Player
        {
            get { return _player; }
        }

        public void EnterLogin(string account)
        {
            _player = new GamePlayer(this);
            _player.Account = account;
            _opened = true;
        }

        public void EnterGame(string name)
        {
            _player.Name = name;
            _player.IsOnline = true;
            // TODO 踢掉另一个
            var player = AppServer.World.GetOnlinePlayer(name);
            if (player != null)
                player.Session.Close();

            //加入到世界和场景
            AppServer.World.AddPlayer(_player);
            AppServer.World.GetScene(_player.SceneId).AddPlayer(_player);
        }

        private GameCommandLogger _cmdLogger= new GameCommandLogger();
        public GameCommandLogger CommandLogger
        {
            get { return _cmdLogger; }
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
