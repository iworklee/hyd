using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Action.Core;

namespace Action.Engine.Command
{
    class CommandFactory
    {
        private ICommand[] _cmds = null;
        private Dictionary<int, ICommand> _hash;

        public CommandFactory(IKernel knl)
        {
            _hash = new Dictionary<int, ICommand>();
            foreach (var cmd in _cmds)
            {
                cmd.Initialize(knl);
                _hash.Add(cmd.Code, cmd);
            }
        }

        public ICommand[] GetCommands()
        {
            return _hash.Values.ToArray<ICommand>();
        }

        public ICommand GetCommand(int code)
        {
            return _hash.ContainsKey(code) ? _hash[code] : null;
        }
    }
}
