using Microsoft.Xna.Framework;
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

        private List<CombatUnit> _aliveUnits = new List<CombatUnit>();
        public List<CombatUnit> AliveUnits { get { return _aliveUnits; } }

        public Vector2 Forward { get; set; }

        public void AddUnit(CombatUnit unit)
        {
            _units.Add(unit);
            _aliveUnits.Add(unit);
        }
    }
}
