using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Model
{
    public class Army
    {
        private List<Unit> _units = new List<Unit>();
        public List<Unit> Units { get { return _units; } }
    }
}
