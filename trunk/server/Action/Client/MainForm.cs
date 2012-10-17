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

namespace Client
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
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
        }

        private void btnDisconnect_Click(object sender, EventArgs e)
        {
            tcpClient.Close();
            btnConnect.Enabled = true;
            btnDisconnect.Enabled = false;
        }

        private void btnSend1_Click(object sender, EventArgs e)
        {
            int cmdId = int.Parse(txtCmdId1.Text);
            writer.Write(cmdId);    // cmdId
            writer.Write(0);        // package length
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
            else if (ddlParamType2.Text == "bool")
            {
                writer.Write(4);
                float param;
                if (float.TryParse(txtParam2.Text, out param))
                    writer.Write(param);
                else
                    writer.Write(0f);
            }
            else
            {
                writer.Write(0);
            }
        }
    }
}
