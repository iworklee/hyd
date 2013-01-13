using Action.Model;
using Action.War;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Buff
{
    public class BuffMetaData
    {
        public int BuffId { get; set; }

        public BuffMetaData(IDictionary<string, object> data)
        {
            BuffId = (int)data["BuffId"];
        }
    }
}

