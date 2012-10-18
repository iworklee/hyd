using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Model
{
    public class Player
    {
        public Player()
        {
        }

        public string Account { get; set; }
        public string Name { get; set; }
        public Role Role { get; set; }
    }
}
