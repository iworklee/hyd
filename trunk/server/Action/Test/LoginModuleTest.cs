using Action.Test.Commands;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Net.Sockets;
using System.IO;
using System.Text;
using System.Configuration;
using MongoDB.Driver;
using Action.Model;
using System.Collections.Generic;
using System.Linq;
using MongoDB.Driver.Builders;

namespace Test
{
    [TestClass()]
    public class LoginModuleTest : TestBase
    {
        [ClassInitialize()]
        public static void Initialize(TestContext testContext)
        {
            for (int i = 0; i < 1000; i++)
			 playerNames.Add("test" + i);

            var connectionString = ConfigurationManager.ConnectionStrings["mongodb"].ConnectionString;
            var mongoDB = MongoServer.Create(connectionString).GetDatabase("Game");
            var table = mongoDB.GetCollection<Player>("Player");
            table.InsertBatch(playerNames.Select(p => new Player { Name = p }));
        }
        [ClassCleanup()]
        public static void ClassCleanup()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["mongodb"].ConnectionString;
            var mongoDB = MongoServer.Create(connectionString).GetDatabase("Game");
            var table = mongoDB.GetCollection<Player>("Player");

            var query = Query<Player>.Where(p=> p.Name.StartsWith("test"));
            table.Remove(query);
        }
        private static List<string> playerNames = new List<string>();

        [TestMethod()]
        public void BackdoorLoginCommandTest()
        {
        }

    }
}
