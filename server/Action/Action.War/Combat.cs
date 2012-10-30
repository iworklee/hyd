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

        private CombatTroops _attacker;
        private CombatTroops _defender;

        public void LoadAttacker(Army attacker)
        {
            _attacker = new CombatTroops();
        }

        public void LoadDefender(Army defender)
        {
            _defender = new CombatTroops();
        }

        public void Perform()
        {
            for (int round = 0; round < MAX_ROUND; round++)
            {
                PerformRound(round);
            }
        }

        private void PerformRound(int round)
        {

        }
    }
}
