using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.Composition;
using SuperSocket.SocketBase.Command;

namespace Action.Buff
{
    [MetadataAttribute]
    [AttributeUsage(AttributeTargets.Class, AllowMultiple = false)]
    public class BuffAttribute : ExportAttribute
    {
        public int BuffId { get; private set; }
        public BuffAttribute(int buffId)
            : base(typeof(IBuff))
        {
            BuffId = buffId;
        }
    }
}
