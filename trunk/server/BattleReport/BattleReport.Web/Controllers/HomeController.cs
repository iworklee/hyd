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
using System.Xml.Linq;

namespace BattleReport.Web.Controllers
{
    [ValidateInput(false)]
    [OutputCache(Location = OutputCacheLocation.None)]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var xmlFile = XElement.Load(Server.MapPath("~/App_Data/UnitType.xml"));
            var data = xmlFile.Elements().Select(x =>
                new SelectListItem { Text = (string)x.Element("Name"), Value = (string)x.Element("ID") });

            var rng = new Random();
            const int MIN = 801;
            const int MAX = 806;

            var model = new WarModel();
            model.AttackerName = "进攻方";
            model.Attacker = new List<string> { 
                rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(),
                rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(),
                "", "", "", "", "",
                "", "", "", "", "",
                "", "", "", "", "",
            };
            model.DefenderName = "防守方";
            model.Defender = new List<string> { 
                rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(),
                rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(), rng.Next(MIN, MAX).ToString(),
                "", "", "", "", "",
                "", "", "", "", "",
                "", "", "", "", "",
            };

            model.DataSource = data;

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
