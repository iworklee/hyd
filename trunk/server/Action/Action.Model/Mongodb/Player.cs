using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Model.Mongodb
{
    public class Player : SmartObj
    {
        public string Account { get; set; }
        public int Job { get; set; }
        public SexEnum Sex { get; set; }
    }
}
