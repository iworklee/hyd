using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ResourceManager.UI
{
    interface INodeClassProperty
    {
        string NodeName { get; set; }
        string Description { get; set; }
    }

    public class NodeClassProperty : INodeClassProperty
    {
        [Category("树节点")]
        public string Description { get; set; }

        private TreeNode _node;

        [Category("树节点")]
        public string NodeName
        {
            get { return _node.Name; }
            set { _node.Name = value; _node.Text = value; }
        }

        public NodeClassProperty(TreeNode node)
        {
            _node = node;
        }

    }

    public class ParentNodeClassProperty : NodeClassProperty
    {
        public ParentNodeClassProperty(TreeNode node) : base(node) { }

        public bool IsCollection { get; set; }

        public string Key { get; set; }

    }
    public class ChildNodeClassProperty : NodeClassProperty
    {
        public ChildNodeClassProperty(TreeNode node) : base(node) { }

        public string PropertyType { get; set; }
    }
}
