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

        public BattleReport Report = new BattleReport();

        private bool _attackerLoaded;
        public void LoadAttacker(Army attacker)
        {
            // 初始化攻方单位
            for (int i = 0; i < 25; i++)
            {
                var unit = new CombatUnit(_attacker);
                unit.UnitTypeID = 1;
                unit.Position = (i + 10).Int2Pos();
                _attacker.AddUnit(unit);
            }
            // 攻方城墙
            for (int i = 0; i < 5; i++)
            {
                var unit = new CombatCampUnit(_attacker);
                unit.UnitTypeID = 0;
                unit.Position = i.Int2Pos();
                _attacker.AddUnit(unit);
            }

            foreach (var unit in _attacker.Units)
            {
                unit.BattleID = unit.Position.Pos2Int();
                Report.Units.Add((BattleUnit)unit);
                attackOrder.Add(unit.CombatPower, unit);
            }

            _attackerLoaded = true;
            _attacker.Forward = new Vector2(1, 0);
            _defender.Enemy = _attacker;
        }

        private bool _defenderLoaded;
        public void LoadDefender(Army defender)
        {
            // 初始化守方单位
            for (int i = 0; i < 25; i++)
            {
                var j = i + 55 - i / 5 * 10;

                var unit = new CombatUnit(_defender);
                unit.Position = j.Int2Pos();

                _defender.AddUnit(unit);
            }

            // 守方城墙
            for (int i = 65; i < 70; i++)
            {
                var unit = new CombatCampUnit(_defender);
                unit.Position = i.Int2Pos();
                _attacker.AddUnit(unit);
            }

            foreach (var unit in _defender.Units)
            {
                unit.BattleID = unit.Position.Pos2Int();
                attackOrder.Add(unit.CombatPower, unit);
            }

            _defenderLoaded = true;
            _attacker.Forward = new Vector2(-1, 0);
            _attacker.Enemy = _defender;
        }

        private SortedDictionary<int, CombatUnit> attackOrder = new SortedDictionary<int, CombatUnit>();

        public bool Perform()
        {
            if (!_attackerLoaded || !_defenderLoaded)
                return false;

            Report.UID = Guid.NewGuid().ToString("N");

            for (int round = 0; round < MAX_ROUND; round++)
            {
                PerformRound(round);
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
            ba.Args = attacker.Position.Pos2Int();// 位置
            return ba;
        }


    }
}
