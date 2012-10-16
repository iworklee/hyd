using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase;
using SuperSocket.SocketBase.Command;
using System.ComponentModel.Composition;

namespace Action.Engine
{
    public class GameServer : AppServer<GameSession, BinaryCommandInfo>
    {

        public GameServer()
            : base(new GameProtocol())
        {
        }

        protected override void OnStartup()
        {
            base.OnStartup();
            foreach (var module in GameModuleFactory.Current.Modules)
                module.Load(this);
        }

        protected override void OnStopped()
        {
            base.OnStopped();
            foreach (var module in GameModuleFactory.Current.Modules)
                module.Unload(this);
        }

        [ImportMany]
        private IEnumerable<Lazy<GameCommand, ICommandMetaData>> _commands = null;

        protected override bool SetupCommands(Dictionary<string, ICommand<GameSession, BinaryCommandInfo>> commandDict)
        {
            if (!Composition.ComposeParts(this))
            {
                Logger.LogError("Failed to load defined command assemblies!");
                return false;
            }

            foreach (var cmd in _commands)
            {
                Logger.LogDebug(string.Format("Command found: {0} - {1}", cmd.Metadata.CommandId, cmd.GetType().AssemblyQualifiedName));

                try
                {
                    if (commandDict.ContainsKey(cmd.Metadata.CommandId.ToString()))
                    {
                        Logger.LogError("Duplicated name command has been found! Command name: " + cmd.Value.Name);
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
    }
}
