using Action.Model;
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

        public void LoadAttacker(Army attacker)
        {

            foreach (var unit in _attacker.Units)
                attackOrder.Add(unit.CombatPower, unit);
        }

        public void LoadDefender(Army defender)
        {

            foreach (var unit in _defender.Units)
                attackOrder.Add(unit.CombatPower, unit);
        }

        private SortedDictionary<int, CombatUnit> attackOrder = new SortedDictionary<int, CombatUnit>();

        public void Perform()
        {
            for (int round = 0; round < MAX_ROUND; round++)
            {
                PerformRound(round);
            }
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

        }

        private IEnumerable<CombatUnit> FindTarget(CombatUnit attacker)
        {
            var range = attacker.StrikeRange;
            return attacker.Troops.Enemy.Units;
        }

        private IEnumerable<CombatUnit> FindSkillTarget(CombatUnit attacker)
        {
            var range = attacker.SkillStrikeRange;
            return attacker.Troops.Enemy.Units;
        }

        private BattleAction Strike(CombatUnit attacker, IEnumerable<CombatUnit> targetUnits)
        {
            throw new NotImplementedException();
        }

        private BattleAction SkillStrike(CombatUnit attacker, IEnumerable<CombatUnit> targetUnits)
        {
            throw new NotImplementedException();
        }

        private BattleAction Move(CombatUnit attacker)
        {
            throw new NotImplementedException();
        }




    }
}
