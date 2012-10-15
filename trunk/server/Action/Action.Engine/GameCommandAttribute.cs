using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.Composition;

namespace Action.Engine
{
    public class GameCommandAttribute : ExportAttribute
    {
        public int CommandId { get; private set; }
        public GameCommandAttribute(int commandId)
            : base(typeof(GameCommand))
        {
            CommandId = commandId;
        }
    }
}
