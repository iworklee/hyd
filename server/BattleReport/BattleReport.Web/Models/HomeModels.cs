using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;

namespace BattleReport.Web.Models
{
    public class WarModel
    {
        public List<string> Attacker { get; set; }

        public List<string> Defender { get; set; }
    }

}
