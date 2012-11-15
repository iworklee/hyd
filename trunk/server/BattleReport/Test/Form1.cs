using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using Action.Model;

namespace Test
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var data = new List<byte>();
            for (int i = 0; i < textBox1.Text.Length; i += 2)
            {
                data.Add(byte.Parse(textBox1.Text.Substring(i, 2), System.Globalization.NumberStyles.HexNumber));
            }

            BattleReport report;
            using (var ms = new MemoryStream(data.ToArray()))
            {
                report = ProtoBuf.Serializer.Deserialize<BattleReport>(ms);
            }
            var id = report.UID;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var data = Convert.FromBase64String(textBox1.Text);
            BattleReport report;
            using (var ms = new MemoryStream(data))
            {
                report = ProtoBuf.Serializer.Deserialize<BattleReport>(ms);
            }
            var id = report.UID;
        }
    }
}
