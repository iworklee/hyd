using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net.Sockets;
using System.IO;
using System.Reflection;
using ProtoBuf;
using MongoDB.Bson;
using Action.Model;

namespace Client
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();

            Application.ThreadException += (sender, e) =>
            {
                var ex = e.Exception;
                MessageBox.Show(ex.ToString());
            };

            AppDomain.CurrentDomain.UnhandledException +=
                (sender, e) =>
                {
                    var ex = e.ExceptionObject;
                    MessageBox.Show(ex.ToString());
                };

        }

        private TcpClient tcpClient;
        private NetworkStream stream;
        private BinaryWriter writer;

        private void btnConnect_Click(object sender, EventArgs e)
        {
            tcpClient = new TcpClient();
            tcpClient.Connect(txtIP.Text, int.Parse(txtPort.Text));
            stream = tcpClient.GetStream();
            writer = new BinaryWriter(stream);
            btnConnect.Enabled = false;
            btnDisconnect.Enabled = true;
            grpCmd1.Enabled = true;
            grpCmd2.Enabled = true;
            grpCmd3.Enabled = true;
        }

        private void btnDisconnect_Click(object sender, EventArgs e)
        {
            tcpClient.Close();
            btnConnect.Enabled = true;
            btnDisconnect.Enabled = false;
            grpCmd1.Enabled = false;
            grpCmd2.Enabled = false;
            grpCmd3.Enabled = false;
        }

        private void btnSend1_Click(object sender, EventArgs e)
        {
            int cmdId = int.Parse(txtCmdId1.Text);
            writer.Write(cmdId);    // cmdId
            writer.Write(0);        // package length
            writer.Flush();
        }

        private void btnSend2_Click(object sender, EventArgs e)
        {
            int cmdId = int.Parse(txtCmdId2.Text);
            writer.Write(cmdId);    // cmdId

            // param
            if (ddlParamType2.Text == "int")
            {
                writer.Write(4);
                int param;
                if (int.TryParse(txtParam2.Text, out param))
                    writer.Write(param);
                else
                    writer.Write(0);
            }
            else if (ddlParamType2.Text == "bool")
            {
                writer.Write(1);
                bool param;
                if (bool.TryParse(txtParam2.Text, out param))
                    writer.Write(param);
                else
                    writer.Write(false);
            }
            else if (ddlParamType2.Text == "float")
            {
                writer.Write(4);
                float param;
                if (float.TryParse(txtParam2.Text, out param))
                    writer.Write(param);
                else
                    writer.Write(0f);
            }
            else if (ddlParamType2.Text == "string")
            {
                var param = Encoding.UTF8.GetBytes(txtParam2.Text);
                writer.Write(param.Length);
                writer.Write(param);
            }
            else
            {
                writer.Write(0);
            }
            writer.Flush();
        }

        private void btnSend3_Click(object sender, EventArgs e)
        {
            var classType = (Type)ddlParamType3.SelectedValue;
            var o = Activator.CreateInstance(classType);

            var newdoc = BsonDocument.Parse(txtBson.Text);
            foreach (var element in newdoc.Elements)
            {
                var prop = classType.GetProperty(element.Name);
                if (prop == null)
                    continue;
                if (element.Value.IsInt32)
                    prop.SetValue(o, element.Value.AsInt32, null);
                else if (element.Value.IsBoolean)
                    prop.SetValue(o, element.Value.AsBoolean, null);
                else if (element.Value.IsDouble)
                    prop.SetValue(o, element.Value.AsDouble, null);
                else if (element.Value.IsString)
                    prop.SetValue(o, element.Value.AsString, null);
            }

            //using (var ms = new MemoryStream())
            //{
            //    Serializer.Serialize<BackdoorLoginArgs>(ms, (BackdoorLoginArgs)o);

            //    var arg = Serializer.Deserialize<BackdoorLoginArgs>(ms);
            //    writer.Write((int)ms.Length);        // package length
            //    ms.WriteTo(stream);
            //}

            using (var ms = new MemoryStream())
            {
                Serializer.NonGeneric.Serialize(ms, o);

                int cmdId = int.Parse(txtCmdId3.Text);
                writer.Write(cmdId);    // cmdId

                writer.Write((int)ms.Length);        // package length
                ms.WriteTo(stream);
            }
            writer.Flush();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            iListBindingSource.DataSource = new List<string> { "string", "int", "bool", "float" };

            var assembly = Assembly.Load("Action.Model");
            var types = assembly.GetExportedTypes()
                .Where(t => !t.IsAbstract && t.GetInterface("IExtensible") != null)
                .ToDictionary(t => t.FullName, t => t);
            ddlParamType3.DataSource = new BindingSource(types, null);
        }

        private void ddlParamType3_SelectedIndexChanged(object sender, EventArgs e)
        {
            var className = ddlParamType3.Text;
            var classType = (Type)ddlParamType3.SelectedValue;
        }
    }
}
