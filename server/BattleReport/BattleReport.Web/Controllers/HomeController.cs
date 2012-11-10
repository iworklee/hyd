using BattleReport.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BattleReport.Web.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Index(WarModel model)
        {

            return View("War");
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
