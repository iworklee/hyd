using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ResourceManager.UI
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void treeView1_AfterSelect(object sender, TreeViewEventArgs e)
        {

        }

        private void parentMenuInsert_Click(object sender, EventArgs e)
        {
            var root=treeView.Nodes[0];
            var node =root.Nodes.Add("");
            node.ContextMenuStrip = childMenu;
            root.LastNode.BeginEdit();
        }

        private void childMenuDelete_Click(object sender, EventArgs e)
        {

        }

        private void treeView_AfterLabelEdit(object sender, NodeLabelEditEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(e.Label))
                e.Node.BeginEdit();
        }
    }
}
