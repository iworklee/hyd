using Action.Test.Commands;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Net.Sockets;
using System.IO;

namespace Test
{
    [TestClass()]
    public class CommandTest
    {
        public TestContext TestContext { get; set; }
        [ClassInitialize()]
        public static void Initialize(TestContext testContext)
        {
            rng = new Random(DateTime.Now.Second);
        }
        [ClassCleanup()]
        public static void ClassCleanup()
        {
        }
        [TestInitialize()]
        public void TestInitialize()
        {
            client = new TcpClient("127.0.0.1", 1808);
            stream = client.GetStream();
            writer = new BinaryWriter(stream);
        }
        [TestCleanup()]
        public void TestCleanup()
        {
            client.Close();
        }
        private static Random rng;
        private TcpClient client;
        private NetworkStream stream;
        private BinaryWriter writer;

        [TestMethod()]
        public void TestCommandTest()
        {
            writer.Write(979);    // cmdId
            writer.Write(0);        // package length
        }

        [TestMethod()]
        public void TestIntCommandTest()
        {
            writer.Write(981);    // cmdId
            writer.Write(4);        // package length
            writer.Write(rng.Next(int.MinValue, int.MaxValue));
        }

        [TestMethod()]
        public void TestBoolCommandTest()
        {
            writer.Write(978);    // cmdId
            writer.Write(1);        // package length
            writer.Write((rng.Next(0, 2) == 1) ? true : false);
        }

        [TestMethod()]
        public void TestFloatCommandTest()
        {
            writer.Write(980);    // cmdId
            writer.Write(4);        // package length
            writer.Write((float)(float.MaxValue * (rng.NextDouble() - 0.5)));
        }

        [TestMethod()]
        public void TestStringCommandTest()
        {
            var bytes = new byte[rng.Next(100)];
            rng.NextBytes(bytes);
            writer.Write(982);    // cmdId
            writer.Write(bytes.Length);        // package length
            writer.Write(bytes);
        }
    }
}
