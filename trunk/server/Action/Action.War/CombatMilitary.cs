using Action.Model;
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
        private Dictionary<Vector2,CombatUnit> _unitsPos = new Dictionary<Vector2,CombatUnit>();

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
            _unitsPos.Add(unit.Position, unit);
        }

        /// <summary>
        /// 根据位置查找单位
        /// </summary>
        /// <param name="pos"></param>
        /// <returns></returns>
        public CombatUnit GetAliveUnitByPos( Vector2 pos)
        {
            CombatUnit unit;
            _unitsPos.TryGetValue(pos, out unit);
            return unit;
        }

        /// <summary>
        /// 移动
        /// </summary>
        /// <param name="unit"></param>
        /// <returns></returns>
        public BattleAction Move(CombatUnit unit)
        {
            unit.Position = unit.Position + unit.Military.Forward;
            var ba = new BattleAction();
            ba.UnitSID = unit.BattleID;

            ba.Type = BattleActionType.Move;    // 移动
            ba.Param = unit.Position.Pos2Int();// 位置
            return ba;
        }
    }
}
