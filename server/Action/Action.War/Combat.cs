using Action.Model;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.War
{
    public class Combat
    {
        const int MAX_ROUND = 50;
        static readonly Vector2 AttackDirection = new Vector2(1, 0);
        static readonly Vector2 DefendDirection = new Vector2(-1, 0);

        private CombatMilitary _attacker = new CombatMilitary();
        private CombatMilitary _defender = new CombatMilitary();
        private BattleReport _report = new BattleReport();
        //private SortedDictionary<int, CombatUnit> attackOrder = new SortedDictionary<int, CombatUnit>();
        private List<CombatUnit> attackOrder = new List<CombatUnit>();
        private bool _attackerLoaded;
        private bool _defenderLoaded;

        /// <summary>
        /// 攻方
        /// </summary>
        public CombatMilitary Attacker { get { return _attacker; } }
        /// <summary>
        /// 守方
        /// </summary>
        public CombatMilitary Defender { get { return _defender; } }
        /// <summary>
        /// 战报
        /// </summary>
        public BattleReport Report { get { return _report; } }

        public void LoadAttacker(Army attacker)
        {
            // 初始化攻方单位
            foreach (var u in attacker.Units)
            {
                var j = u.Positon + 10;

                var unit = CombatUnitFactory.Instance.CreateUnit(u.ID);
                Attacker.PlaceUnit(unit, j);
            }

            // 攻方城墙
            for (int i = 0; i < 5; i++)
            {
                var unit = CombatUnitFactory.Instance.CreateUnit(0);
                Attacker.PlaceUnit(unit, i);
            }

            foreach (var unit in Attacker.Units)
            {
                Report.Units.Add((BattleUnit)unit);
            }

            _attackerLoaded = true;
            Attacker.Forward = AttackDirection;
            Defender.Enemy = Attacker;
        }

        public void LoadDefender(Army defender)
        {
            // 初始化守方单位
            foreach (var u in defender.Units)
            {
                var j = u.Positon + 55 - u.Positon / 5 * 10;

                var unit = CombatUnitFactory.Instance.CreateUnit(u.ID);
                Defender.PlaceUnit(unit, j);
            }

            // 守方城墙
            for (int i = 65; i < 70; i++)
            {
                var unit = CombatUnitFactory.Instance.CreateUnit(0);
                Defender.PlaceUnit(unit, i);
            }

            foreach (var unit in Defender.Units)
            {
                Report.Units.Add((BattleUnit)unit);
            }

            _defenderLoaded = true;
            Defender.Forward = DefendDirection;
            Attacker.Enemy = Defender;
        }

        public bool Perform()
        {
            if (!_attackerLoaded || !_defenderLoaded)
                return false;

            attackOrder = Attacker.Units.Concat(Defender.Units).OrderByDescending(u => u.CombatPower).ToList();

            Report.UID = Guid.NewGuid().ToString("N");

            for (int round = 1; round <= MAX_ROUND; round++)
            {
                PerformRound(round);

                if (Attacker.Defeated || Attacker.AliveUnits.Count() == 5)
                {
                    // 攻方胜
                    break;
                }

                if (Defender.Defeated || Defender.AliveUnits.Count() == 5)
                {
                    // 守方胜
                    break;
                }
            }

            return true;
        }

        private void PerformRound(int round)
        {
            BattleBout bout = new BattleBout();
            bout.SID = round;

            foreach (var attacker in attackOrder.Where(unit => unit.Military.AliveUnits.Contains(unit)))
            {
                var action = attacker.Strike();
                if (action != null)
                {
                    bout.Actions.Add(action);
                    continue;
                }

                action = attacker.Move();
                if (action != null)
                    bout.Actions.Add(action);
            }

            Report.Bouts.Add(bout);
        }


    }
}
