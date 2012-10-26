namespace ResourceManager.UI
{
    partial class MainForm
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.Windows.Forms.TreeNode treeNode1 = new System.Windows.Forms.TreeNode("Id");
            System.Windows.Forms.TreeNode treeNode2 = new System.Windows.Forms.TreeNode("Name");
            System.Windows.Forms.TreeNode treeNode3 = new System.Windows.Forms.TreeNode("Value");
            System.Windows.Forms.TreeNode treeNode4 = new System.Windows.Forms.TreeNode("Root", new System.Windows.Forms.TreeNode[] {
            treeNode1,
            treeNode2,
            treeNode3});
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.splitContainer2 = new System.Windows.Forms.SplitContainer();
            this.treeView = new System.Windows.Forms.TreeView();
            this.parentMenu = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.parentMenuInsert = new System.Windows.Forms.ToolStripMenuItem();
            this.propertyGrid1 = new System.Windows.Forms.PropertyGrid();
            this.childMenu = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.childMenuDelete = new System.Windows.Forms.ToolStripMenuItem();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer2)).BeginInit();
            this.splitContainer2.Panel1.SuspendLayout();
            this.splitContainer2.Panel2.SuspendLayout();
            this.splitContainer2.SuspendLayout();
            this.parentMenu.SuspendLayout();
            this.childMenu.SuspendLayout();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.splitContainer2);
            this.splitContainer1.Size = new System.Drawing.Size(634, 416);
            this.splitContainer1.SplitterDistance = 311;
            this.splitContainer1.TabIndex = 0;
            this.splitContainer1.TabStop = false;
            // 
            // splitContainer2
            // 
            this.splitContainer2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.splitContainer2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer2.Location = new System.Drawing.Point(0, 0);
            this.splitContainer2.Name = "splitContainer2";
            // 
            // splitContainer2.Panel1
            // 
            this.splitContainer2.Panel1.Controls.Add(this.treeView);
            // 
            // splitContainer2.Panel2
            // 
            this.splitContainer2.Panel2.Controls.Add(this.propertyGrid1);
            this.splitContainer2.Size = new System.Drawing.Size(634, 311);
            this.splitContainer2.SplitterDistance = 246;
            this.splitContainer2.TabIndex = 0;
            this.splitContainer2.TabStop = false;
            // 
            // treeView
            // 
            this.treeView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.treeView.LabelEdit = true;
            this.treeView.Location = new System.Drawing.Point(0, 0);
            this.treeView.Name = "treeView";
            treeNode1.ContextMenuStrip = this.childMenu;
            treeNode1.Name = "a";
            treeNode1.Text = "Id";
            treeNode2.ContextMenuStrip = this.childMenu;
            treeNode2.Name = "b";
            treeNode2.Text = "Name";
            treeNode3.ContextMenuStrip = this.childMenu;
            treeNode3.Name = "c";
            treeNode3.Text = "Value";
            treeNode4.ContextMenuStrip = this.parentMenu;
            treeNode4.Name = "root";
            treeNode4.Text = "Root";
            this.treeView.Nodes.AddRange(new System.Windows.Forms.TreeNode[] {
            treeNode4});
            this.treeView.Size = new System.Drawing.Size(242, 307);
            this.treeView.TabIndex = 0;
            this.treeView.AfterLabelEdit += new System.Windows.Forms.NodeLabelEditEventHandler(this.treeView_AfterLabelEdit);
            // 
            // parentMenu
            // 
            this.parentMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.parentMenuInsert});
            this.parentMenu.Name = "parentMenu";
            this.parentMenu.Size = new System.Drawing.Size(95, 26);
            // 
            // parentMenuInsert
            // 
            this.parentMenuInsert.Name = "parentMenuInsert";
            this.parentMenuInsert.Size = new System.Drawing.Size(94, 22);
            this.parentMenuInsert.Text = "插入";
            this.parentMenuInsert.Click += new System.EventHandler(this.parentMenuInsert_Click);
            // 
            // propertyGrid1
            // 
            this.propertyGrid1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.propertyGrid1.Location = new System.Drawing.Point(0, 0);
            this.propertyGrid1.Name = "propertyGrid1";
            this.propertyGrid1.Size = new System.Drawing.Size(380, 307);
            this.propertyGrid1.TabIndex = 0;
            // 
            // childMenu
            // 
            this.childMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.childMenuDelete});
            this.childMenu.Name = "childMenu";
            this.childMenu.Size = new System.Drawing.Size(95, 26);
            // 
            // childMenuDelete
            // 
            this.childMenuDelete.Name = "childMenuDelete";
            this.childMenuDelete.Size = new System.Drawing.Size(94, 22);
            this.childMenuDelete.Text = "删除";
            this.childMenuDelete.Click += new System.EventHandler(this.childMenuDelete_Click);
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(634, 416);
            this.Controls.Add(this.splitContainer1);
            this.Name = "MainForm";
            this.Text = "Form1";
            this.splitContainer1.Panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.splitContainer2.Panel1.ResumeLayout(false);
            this.splitContainer2.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer2)).EndInit();
            this.splitContainer2.ResumeLayout(false);
            this.parentMenu.ResumeLayout(false);
            this.childMenu.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.SplitContainer splitContainer2;
        private System.Windows.Forms.TreeView treeView;
        private System.Windows.Forms.ContextMenuStrip parentMenu;
        private System.Windows.Forms.ToolStripMenuItem parentMenuInsert;
        private System.Windows.Forms.PropertyGrid propertyGrid1;
        private System.Windows.Forms.ContextMenuStrip childMenu;
        private System.Windows.Forms.ToolStripMenuItem childMenuDelete;
    }
}

