using BattleReport.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Action.Model;
using System.IO;
using Action.War;
using System.Diagnostics;
using System.Text;
using System.Web.UI;

namespace BattleReport.Web.Controllers
{
    [ValidateInput(false)]
    [OutputCache(Location = OutputCacheLocation.None)]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var model = new WarModel();
            model.AttackerName = "进攻方";
            model.Attacker = new List<string> { 
                "801", "801", "801", "801", "801",
                "804", "804", "804", "804", "804",
                "", "", "", "", "",
                "", "", "", "", "",
                "", "", "", "", "",
            };
            model.DefenderName = "防守方";
            model.Defender = new List<string> { 
                "801", "801", "801", "801", "801",
                "804", "804", "804", "804", "804",
                "", "", "", "", "",
                "", "", "", "", "",
                "", "", "", "", "",
            };
            //model.DataSource = new SelectList(new[] {
            //    new SelectListItem { Text = "步兵", Value = "801" },
            //    new SelectListItem { Text = "弓手", Value = "804" },
            //}, "Value", "Text");
            model.DataSource = new List<SelectListItem> {
                new SelectListItem { Text = "步兵", Value = "801" },
                new SelectListItem { Text = "弓手", Value = "804" },
            };

            return View(model);
        }

        [HttpPost]
        public ActionResult Index(WarModel model)
        {
            var combat = new Combat();

            var attacker = new Army();
            //attacker.Units.AddRange(
            //    model.Attacker.Where(id => !string.IsNullOrWhiteSpace(id))
            //    .Select((id, pos) => { return new Unit { ID = int.Parse(id), Positon = pos }; })
            //    );

            for (int i = 0; i < model.Attacker.Count; i++)
            {
                if (!string.IsNullOrWhiteSpace(model.Attacker[i]))
                    attacker.Units.Add(new Unit { ID = int.Parse(model.Attacker[i]), Positon = i });
            }
            combat.LoadAttacker(attacker);

            var defender = new Army();
            //defender.Units.AddRange(
            //    model.Defender.Where(id => !string.IsNullOrWhiteSpace(id))
            //    .Select((id, pos) => { return new Unit { ID = int.Parse(id), Positon = pos }; })
            //    );
            for (int i = 0; i < model.Defender.Count; i++)
            {
                if (!string.IsNullOrWhiteSpace(model.Defender[i]))
                    defender.Units.Add(new Unit { ID = int.Parse(model.Defender[i]), Positon = i });
            }
            combat.LoadDefender(defender);

            if (!combat.Perform())
                return View();

            combat.Report.Player1 = model.AttackerName;
            combat.Report.Player2 = model.DefenderName;

            using (var ms = new MemoryStream())
            {
                ProtoBuf.Serializer.Serialize(ms, combat.Report);
                //ViewBag.Data = Convert.ToBase64String(ms.ToArray());
                var data = ms.ToArray();
                var sb = new StringBuilder();
                foreach (var b in data)
                {
                    sb.Append(b.ToString("x2"));
                }
                ViewBag.Data = sb.ToString();
            }
            return View("War");
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
