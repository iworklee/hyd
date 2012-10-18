using Action.Test.Commands;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Net.Sockets;
using System.IO;
using System.Text;

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
            reader = new BinaryReader(stream);
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
        private BinaryReader reader;

        [TestMethod()]
        public void TestCommandTest()
        {
            writer.Write(979);    // cmdId
            writer.Write(0);        // package length

            Assert.AreEqual(979, reader.ReadInt32());
            Assert.AreEqual(0, reader.ReadInt32());
        }

        [TestMethod()]
        public void TestIntCommandTest()
        {
            var value = rng.Next(int.MinValue, int.MaxValue);
            writer.Write(981);    // cmdId
            writer.Write(4);        // package length
            writer.Write(value);

            Assert.AreEqual(981, reader.ReadInt32());
            Assert.AreEqual(4, reader.ReadInt32());
            Assert.AreEqual(value, reader.ReadInt32());
        }

        [TestMethod()]
        public void TestBoolCommandTest()
        {
            var value = rng.Next(0, 2) == 1 ? true : false;
            writer.Write(978);    // cmdId
            writer.Write(1);        // package length
            writer.Write(value);

            Assert.AreEqual(978, reader.ReadInt32());
            Assert.AreEqual(1, reader.ReadInt32());
            Assert.AreEqual(value, reader.ReadBoolean());
        }

        [TestMethod()]
        public void TestFloatCommandTest()
        {
            var value = (float)(float.MaxValue * (rng.NextDouble() - 0.5));
            writer.Write(980);    // cmdId
            writer.Write(4);        // package length
            writer.Write(value);

            Assert.AreEqual(980, reader.ReadInt32());
            Assert.AreEqual(4, reader.ReadInt32());
            Assert.AreEqual(value, reader.ReadSingle());
        }

        [TestMethod()]
        public void TestStringCommandTest()
        {
            var bytes = Encoding.UTF8.GetBytes("摘要：今天试探性的打开了66.178.223.73的VS2005，添加了个Form和几个控件");
            writer.Write(982);    // cmdId
            writer.Write(bytes.Length);        // package length
            writer.Write(bytes);

            Assert.AreEqual(982, reader.ReadInt32());
            Assert.AreEqual(bytes.Length, reader.ReadInt32());

            int i = 0;
            foreach (var b in reader.ReadBytes(bytes.Length))
            {
                Assert.AreEqual(bytes[i++], b);
            }
        }
    }
}
