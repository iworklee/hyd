﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Command;

namespace Action.Engine
{
    public class GameCommandLogger
    {
        private Dictionary<int, DateTime> _lastCmds = new Dictionary<int, DateTime>();
        private List<BinaryCommandInfo> _allCmds = new List<BinaryCommandInfo>();

        public void LogCommand(int commandId, BinaryCommandInfo commandInfo)
        {
            _lastCmds[commandId] = DateTime.Now;
            //_allCmds.Add(commandInfo);
        }

        public DateTime GetCommandLastExecTime(int commandId)
        {
            var lastTime = DateTime.MinValue;
            if (_lastCmds.TryGetValue(commandId, out lastTime))
                return lastTime;
            else
                return DateTime.MinValue;
        }

        public DateTime GetTimeOutOfCommandCD(int commandId, int commandCD)
        {
            return GetCommandLastExecTime(commandId).AddMilliseconds(commandCD);
        }

        public int GetLeftSecondsWhenOutOfCommandCD(int commandId, int commandCD)
        {
            return (int)(GetCommandLastExecTime(commandId).AddMilliseconds(commandCD) - DateTime.Now).TotalSeconds;
        }

        public bool IsCommandInCD(int commandId, int commandCD)
        {
            return GetLeftSecondsWhenOutOfCommandCD(commandId, commandCD) > 0;
        }
    }
}