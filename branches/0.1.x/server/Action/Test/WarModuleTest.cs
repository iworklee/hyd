
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Net.Sockets;
using System.IO;
using System.Text;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using MongoDB.Driver;
using MongoDB.Driver.Builders;
using ProtoBuf;
using Action.Model;
using System.Diagnostics;

namespace Test
{
    [TestClass()]
    public class WarModuleTest : TestBase
    {
        //[ClassInitialize()]
        public static void Initialize(TestContext testContext)
        {
            var unitIDs = new[] { 
                801, 802, 803, 804, 805,
                98, 225, 245, 289, 343,
                370, 395, 424, 432, 660,
            };
            var rng = new Random();

            for (int i = 0; i < 1000; i++)
                playerNames.Add("test" + i);

            try
            {
                var connectionString = ConfigurationManager.ConnectionStrings["mongodb"].ConnectionString;
                var mongoDB = MongoServer.Create(connectionString).GetDatabase("Game");
                var table = mongoDB.GetCollection<Player>("Player");
                var players = playerNames.Select(p =>
                {
                    var player = new Player { Account = p, Name = p };
                    var units = Enumerable.Range(0, 25).Select(i => new Unit { ID = unitIDs[rng.Next(0, unitIDs.Length)], Positon = i });
                    player.Army.Units.AddRange(units);
                    return player;
                });
                table.InsertBatch(players);
            }
            catch (Exception)
            {
            }
        }

        //[ClassCleanup()]
        public static void ClassCleanup()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["mongodb"].ConnectionString;
            var mongoDB = MongoServer.Create(connectionString).GetDatabase("Game");
            var table = mongoDB.GetCollection<Player>("Player");

            var query = Query<Player>.Where(p => p.Name.StartsWith("test"));
            table.Remove(query);
        }
        private static List<string> playerNames = new List<string>();

        private const int COUNT = 100000000;

        [TestMethod()]
        public void TestMakeWarCommand()
        {

            byte[] send = new byte[8];
            Buffer.BlockCopy(BitConverter.GetBytes(984), 0, send, 0, 4);// cmdId
            Buffer.BlockCopy(BitConverter.GetBytes(0), 0, send, 4, 4);// package length

            for (int i = 0; i < COUNT; i++)
            {
                stream.Write(send, 0, 8);
                var cmdId = reader.ReadInt32();
                //Assert.AreEqual(984, cmdId);
                var length = reader.ReadInt32();
                //Assert.AreNotEqual(0, length);
                var data = reader.ReadBytes(length);
                //using (var ms = new MemoryStream(data))
                //{
                //    var report = Serializer.Deserialize<BattleReport>(ms);
                //    Debug.WriteLine(report.Win);
                //}
            }
        }

    }
}
