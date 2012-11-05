using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.War
{
    public class CombatMilitary
    {
        private List<CombatUnit> _units = new List<CombatUnit>();
        private List<CombatUnit> _aliveUnits = new List<CombatUnit>();

        /// <summary>
        /// 敌军
        /// </summary>
        public CombatMilitary Enemy { get; set; }

        /// <summary>
        /// 全部单位
        /// </summary>
        public IEnumerable<CombatUnit> Units { get { return _units.AsReadOnly(); } }

        /// <summary>
        /// 存活单位
        /// </summary>
        public IEnumerable<CombatUnit> AliveUnits { get { return _aliveUnits.AsReadOnly(); } }

        /// <summary>
        /// 营寨被攻陷
        /// </summary>
        public bool Defeated { get; set; }

        /// <summary>
        /// 前进方向
        /// </summary>
        public Vector2 Forward { get; set; }

        /// <summary>
        /// 添加单位
        /// </summary>
        /// <param name="unit"></param>
        public void AddUnit(CombatUnit unit)
        {
            _units.Add(unit);
            _aliveUnits.Add(unit);
        }
    }
}
