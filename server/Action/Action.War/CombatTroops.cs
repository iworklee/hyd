using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.War
{
    public class CombatTroops
    {
        public CombatTroops Enemy { get; set; }

        private List<CombatUnit> _units = new List<CombatUnit>();
        public List<CombatUnit> Units { get { return _units; } }

    }
}
