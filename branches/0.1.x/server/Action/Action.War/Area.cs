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

        public IEnumerable<CombatUnit> FindBy(CombatUnit self, Vector2 direction)
        {
            var military = _getMilitary(self);

            //var unitization = Vector2.Normalize(direction);
            //var invert = Vector2.Zero - unitization;
            //var matrix = new Matrix(unitization.X, unitization.Y, 0, 0, invert.Y, invert.X, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

            var angle = (float)Math.Atan2(direction.Y, direction.X);
            var matrix = Matrix.CreateRotationZ(angle);

            return _range
                .Select(loc =>
                {
                    var rotate = Vector2.Transform(loc, matrix);
                    var pos = self.Position + direction + rotate;
                    return military.GetAliveUnitByPos(new Vector2((float)Math.Round(pos.X), (float)Math.Round(pos.Y)));
                })
                .Where(u => u != null)
                .Take(_count);
        }

        public IEnumerable<CombatUnit> FindBy(CombatUnit self)
        {
            //return FindBy(self, Vector2.Zero);
            var military = _getMilitary(self);
            return _range
                .Select(loc => military.GetAliveUnitByPos(self.Position + loc * self.Military.Forward))
                .Where(u => u != null)
                .Take(_count);
        }
    }
}
