using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Model
{
    public class Player
    {
        public string Account { get; set; }
        public string Name { get; set; }
        public int Job { get; set; }
        public SexEnum Sex { get; set; }
    }
}
