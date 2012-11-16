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
        public string AttackerName { get; set; }

        public List<string> Attacker { get; set; }

        public string DefenderName { get; set; }

        public List<string> Defender { get; set; }

        public IEnumerable<SelectListItem> DataSource { get; set; }
    }
}
