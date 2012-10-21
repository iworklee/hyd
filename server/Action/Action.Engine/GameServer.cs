using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Collections.Concurrent;
using System.ComponentModel.Composition;
using SuperSocket.SocketBase;
using SuperSocket.SocketBase.Command;
using MongoDB.Driver;

namespace Action.Engine
{
    public class GameServer : AppServer<GameSession, BinaryCommandInfo>
    {
        public GameServer()
            : base(new GameProtocol())
        {
            _world = new GameWorld(this);
        }

        private GameWorld _world;
        public GameWorld World
        {
            get { return _world; }
        }

        public override bool Setup(SuperSocket.SocketBase.Config.IRootConfig rootConfig, SuperSocket.SocketBase.Config.IServerConfig config, ISocketServerFactory socketServerFactory, SuperSocket.SocketBase.Protocol.ICustomProtocol<BinaryCommandInfo> protocol)
        {
            if (!base.Setup(rootConfig, config, socketServerFactory, protocol))
                return false;

            try
            {
                MongoServer.Ping();
            }
            catch (Exception ex)
            {
                Logger.LogError("The MongoDB Server is not alive!", ex);
                return false;
            }
            return true;
        }

        protected override void OnStartup()
        {
            base.OnStartup();
            foreach (var module in GameModuleFactory.Current.Modules)
                module.Load(_world);
        }

        protected override void OnStopped()
        {
            base.OnStopped();
            foreach (var module in GameModuleFactory.Current.Modules)
                module.Unload(_world);
        }

        protected override void OnPerformanceDataCollected(GlobalPerformanceData globalPerfData, PerformanceData performanceData)
        {
            // TODO 周期性记录在线玩家数量等信息
        }

        protected override void OnAppSessionClosed(object sender, AppSessionClosedEventArgs<GameSession> e)
        {
            if (e.Session.Opened)
            {
                //各模块处理玩家离开游戏
                foreach (var module in GameModuleFactory.Current.Modules)
                    module.LeaveGame(e.Session.Player);

                //从世界删除玩家
                e.Session.AppServer.World.RemovePlayer(e.Session.Player);
            }
        }

        [ImportMany]
        private IEnumerable<Lazy<GameCommandBase, ICommandMetaData>> _commands = null;

        protected override bool SetupCommands(Dictionary<string, ICommand<GameSession, BinaryCommandInfo>> commandDict)
        {
            if (!Composition.ComposeParts(this))
            {
                Logger.LogError("Failed to load defined command assemblies!");
                return false;
            }

            foreach (var cmd in _commands)
            {
                Logger.LogDebug(string.Format("Command found: {0} - {1}", cmd.Value.ToString(), cmd.Value.GetType().AssemblyQualifiedName));

                try
                {
                    if (commandDict.ContainsKey(cmd.Metadata.CommandId.ToString()))
                    {
                        Logger.LogError(string.Format("Duplicated name command has been found! Command : {0}", cmd.Value.ToString()));
                        return false;
                    }

                    commandDict.Add(cmd.Metadata.CommandId.ToString(), cmd.Value);
                }
                catch
                {
                }
            }

            CommandFilterFactory.GenerateCommandFilterLibrary(this.GetType(), commandDict.Values.Cast<ICommand>());

            return true;
        }

        public MongoServer MongoServer
        {
            get
            {
                var connectionString = ConfigurationManager.ConnectionStrings["mongodb"].ConnectionString;
                return MongoServer.Create(connectionString);
            }
        }

        public MongoDatabase DefaultDatabase
        {
            get
            {
                var connectionString = ConfigurationManager.ConnectionStrings["mongodb"].ConnectionString;
                return MongoDatabase.Create(connectionString);
            }
        }
    }
}
