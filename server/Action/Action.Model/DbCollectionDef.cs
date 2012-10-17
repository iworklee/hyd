using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Model
{
    public class DbCollectionDef
    {
        public class Player
        {
            public const string Name = "Player";
            public const string Key = "Account";
        }

        public class PlayerIndex
        {
            public const string Name = "PlayerIndex";
            public const string Key = "Name";
        }
    }
}
