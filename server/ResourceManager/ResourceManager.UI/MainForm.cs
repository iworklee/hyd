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

        private void MainForm_Load(object sender, EventArgs e)
        {
            var node = treeView.Nodes.Add("Root");
            node.Name = node.Text;
            node.Tag = new ParentNodeClassProperty(node);
        }

        /***************    TreeView    ***************/

        //private void treeView_BeforeLabelEdit(object sender, NodeLabelEditEventArgs e)
        //{
        //    //treeView.Nodes.
        //}
        //private void treeView_AfterLabelEdit(object sender, NodeLabelEditEventArgs e)
        //{
        //    if (string.IsNullOrWhiteSpace(e.Label))
        //    {
        //        e.Node.BeginEdit();
        //        return;
        //    }

        //    e.Node.Name = e.Label;
        //    (e.Node.Tag as NodeClassProperty).SetNodeName(e.Label);
        //}

        private void treeView_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                var node = treeView.GetNodeAt(e.Location);

                if (!node.Bounds.Contains(e.Location))
                    return;

                if (treeView.SelectedNode != node)
                    treeView.SelectedNode = node;

                if (node.Parent == null || node.Nodes.Count != 0)
                    parentMenu.Show(treeView, e.Location);
                else
                    childMenu.Show(treeView, e.Location);
            }
        }

        private void treeView_BeforeSelect(object sender, TreeViewCancelEventArgs e)
        {
            var node = e.Node;
        }

        private void treeView_AfterSelect(object sender, TreeViewEventArgs e)
        {
            var node = e.Node;
            propertyGrid.SelectedObject = node.Tag
;
        }


        private void parentMenuInsert_Click(object sender, EventArgs e)
        {
            var root = treeView.Nodes[0];
            var node = root.Nodes.Add("");
            node.Name = node.Text;
            node.Tag = new ChildNodeClassProperty(node);

            treeView.SelectedNode = node;
            node.EnsureVisible();
            propertyGrid.Select();
        }

        private void childMenuDelete_Click(object sender, EventArgs e)
        {
            var node = treeView.SelectedNode;
            node.Parent.Nodes.Remove(node);
        }

        private void menuEdit_Click(object sender, EventArgs e)
        {
            var node = treeView.SelectedNode;
            propertyGrid.Select();
        }


    }
}
