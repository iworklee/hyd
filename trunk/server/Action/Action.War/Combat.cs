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

        private CombatMilitary _attacker = new CombatMilitary();
        private CombatMilitary _defender = new CombatMilitary();
        private BattleReport _report = new BattleReport();
        private SortedDictionary<int, CombatUnit> attackOrder = new SortedDictionary<int, CombatUnit>();
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
            for (int i = 0; i < 25; i++)
            {
                var unit = new CombatUnit(Attacker);
                unit.UnitTypeID = 1;
                unit.Position = (i + 10).Int2Pos();
                Attacker.AddUnit(unit);
            }
            // 攻方城墙
            for (int i = 0; i < 5; i++)
            {
                var unit = new CombatCampUnit(Attacker);
                unit.UnitTypeID = 0;
                unit.Position = i.Int2Pos();
                Attacker.AddUnit(unit);
            }

            foreach (var unit in Attacker.Units)
            {
                unit.BattleID = unit.Position.Pos2Int();
                Report.Units.Add((BattleUnit)unit);
                attackOrder.Add(unit.CombatPower, unit);
            }

            _attackerLoaded = true;
            Attacker.Forward = new Vector2(1, 0);
            Defender.Enemy = Attacker;
        }

        public void LoadDefender(Army defender)
        {
            // 初始化守方单位
            for (int i = 0; i < 25; i++)
            {
                var j = i + 55 - i / 5 * 10;

                var unit = new CombatUnit(Defender);
                unit.Position = j.Int2Pos();

                Defender.AddUnit(unit);
            }

            // 守方城墙
            for (int i = 65; i < 70; i++)
            {
                var unit = new CombatCampUnit(Defender);
                unit.Position = i.Int2Pos();
                Attacker.AddUnit(unit);
            }

            foreach (var unit in Defender.Units)
            {
                unit.BattleID = unit.Position.Pos2Int();
                attackOrder.Add(unit.CombatPower, unit);
            }

            _defenderLoaded = true;
            Attacker.Forward = new Vector2(-1, 0);
            Attacker.Enemy = Defender;
        }

        public bool Perform()
        {
            if (!_attackerLoaded || !_defenderLoaded)
                return false;

            Report.UID = Guid.NewGuid().ToString("N");

            for (int round = 0; round < MAX_ROUND; round++)
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

            if (round % 2 == 0)
            {
                // skill round
                foreach (var attacker in attackOrder.Values)
                {
                    var action = attacker.SkillStrike();
                    if (action != null)
                        bout.Actions.Add(action);
                }
            }
            else
            {
                // normal round
                foreach (var attacker in attackOrder.Values)
                {
                    var action = attacker.Strike();
                    if (action != null)
                    {
                        bout.Actions.Add(action);
                        continue;
                    }

                    action = Move(attacker);
                    if (action != null)
                        bout.Actions.Add(action);
                }
            }

            foreach (var unit in attackOrder.Values)
            {
                if (unit.Health == 0)
                    attackOrder.Remove(unit.CombatPower);
            }

            Report.Bouts.Add(bout);
        }

        private BattleAction Move(CombatUnit attacker)
        {
            attacker.Position = attacker.Position + attacker.Military.Forward;
            var ba = new BattleAction();
            ba.UnitSID = attacker.BattleID;
            ba.Type = BattleActionType.Move;    // 移动
            ba.Param = attacker.Position.Pos2Int();// 位置
            return ba;
        }


    }
}
