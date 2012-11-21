using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;
using ProtoBuf;

namespace BattleReport.Web.Models
{
    [ProtoContract]
    public class WarModel
    {
        [ProtoMember(1)]
        public string AttackerName { get; set; }

        [ProtoMember(2)]
        public List<string> Attacker { get; set; }

        [ProtoMember(3)]
        public string DefenderName { get; set; }

        [ProtoMember(4)]
        public List<string> Defender { get; set; }

        public IEnumerable<SelectListItem> DataSource { get; set; }
    }
}
