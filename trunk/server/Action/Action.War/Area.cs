using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Xna.Framework;
using System.Xml.Linq;

namespace Action.War
{
    public class Area
    {
        private IEnumerable<Vector2> _range;
        private int _count;
        private Func<CombatUnit, CombatMilitary> _getMilitary;

        public Area(XElement area)
        {
            _range = RangeProvider.Generate((string)area.Element("Range"));
            _count = (int)area.Element("Count");
            if ((bool)area.Element("Enemy"))
                _getMilitary = u => u.Military.Enemy;
            else
                _getMilitary = u => u.Military;
        }

        public IEnumerable<CombatUnit> FindBy(CombatUnit unit)
        {
            var military = _getMilitary(unit);
            return _range
                .Select(loc => military.GetAliveUnitByPos(unit.Position + loc * unit.Military.Forward))
                .Where(u => u != null)
                .Take(_count);
        }
    }
}
