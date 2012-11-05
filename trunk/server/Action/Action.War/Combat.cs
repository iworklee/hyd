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

        private CombatTroops _attacker = new CombatTroops();
        private CombatTroops _defender = new CombatTroops();

        public BattleReport Report = new BattleReport();

        private bool _attackerLoaded;
        public void LoadAttacker(Army attacker)
        {
            // 初始化攻方单位
            for (int i = 0; i < 25; i++)
            {
                var unit = new CombatUnit();
                unit.ID = 1;
                unit.Position = (i + 10).Int2Pos();
                _attacker.Units.Add(unit);
            }
            // 攻方城墙
            for (int i = 0; i < 5; i++)
            {
                var unit = new CombatUnit();
                unit.ID = 0;
                unit.Position = i.Int2Pos();
                _attacker.Units.Add(unit);
            }

            foreach (var unit in _attacker.Units)
            {
                unit.SID = unit.Position.Pos2Int();
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

                var unit = new CombatUnit();
                unit.Position = j.Int2Pos();

                _defender.Units.Add(unit);
            }

            // 守方城墙
            for (int i = 65; i < 70; i++)
            {
                var unit = new CombatUnit();
                unit.Position = i.Int2Pos();
                _attacker.Units.Add(unit);
            }

            foreach (var unit in _defender.Units)
            {
                unit.SID = unit.Position.Pos2Int();
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
                    BattleAction action;
                    IEnumerable<CombatUnit> targetUnits = FindSkillTarget(attacker);
                    if (targetUnits.Any())
                    {
                        action = SkillStrike(attacker, targetUnits);
                        bout.Actions.Add(action);
                    }
                }
            }
            else
            {
                // normal round
                foreach (var attacker in attackOrder.Values)
                {
                    BattleAction action;
                    IEnumerable<CombatUnit> targetUnits = FindTarget(attacker);
                    if (targetUnits.Any())
                        action = Strike(attacker, targetUnits);
                    else
                        action = Move(attacker);

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

        private IEnumerable<CombatUnit> FindTarget(CombatUnit attacker)
        {
            var range = attacker.StrikeRange;
            return attacker.Troops.Enemy.Units.Where(unit => Vector2.Distance(attacker.Position, unit.Position) <= range);
        }

        private IEnumerable<CombatUnit> FindSkillTarget(CombatUnit attacker)
        {
            var range = attacker.SkillStrikeRange;
            return attacker.Troops.Enemy.Units.Where(unit => Vector2.Distance(attacker.Position, unit.Position) <= range);
        }

        private BattleAction Strike(CombatUnit attacker, IEnumerable<CombatUnit> targetUnits)
        {
            return attacker.Strike(targetUnits);
        }

        private BattleAction SkillStrike(CombatUnit attacker, IEnumerable<CombatUnit> targetUnits)
        {
            return attacker.SkillStrike(targetUnits);
        }

        private BattleAction Move(CombatUnit attacker)
        {
            attacker.Position = attacker.Position + attacker.Troops.Forward;
            var ba = new BattleAction();
            ba.Type = BattleActionType.Move;
            ba.UnitSID = attacker.SID;
            ba.Args = attacker.Position.Pos2Int();
            return ba;
        }


    }
}
