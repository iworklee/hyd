﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Engine
{
    public class GamePlayer
    {
        public string Account { get; set; }
        public bool IsOnline { get; set; }
        public string Name { get; set; }
        public int Job { get; set; }
        public int Sex { get; set; }
    }
}