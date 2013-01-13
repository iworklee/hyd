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
            this.childMenu = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.childMenuEdit = new System.Windows.Forms.ToolStripMenuItem();
            this.childMenuDelete = new System.Windows.Forms.ToolStripMenuItem();
            this.parentMenu = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.parentMenuEdit = new System.Windows.Forms.ToolStripMenuItem();
            this.parentMenuInsert = new System.Windows.Forms.ToolStripMenuItem();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.splitContainer2 = new System.Windows.Forms.SplitContainer();
            this.treeView = new System.Windows.Forms.TreeView();
            this.propertyGrid = new System.Windows.Forms.PropertyGrid();
            this.childMenu.SuspendLayout();
            this.parentMenu.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer2)).BeginInit();
            this.splitContainer2.Panel1.SuspendLayout();
            this.splitContainer2.Panel2.SuspendLayout();
            this.splitContainer2.SuspendLayout();
            this.SuspendLayout();
            // 
            // childMenu
            // 
            this.childMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.childMenuEdit,
            this.childMenuDelete});
            this.childMenu.Name = "childMenu";
            this.childMenu.Size = new System.Drawing.Size(101, 48);
            // 
            // childMenuEdit
            // 
            this.childMenuEdit.Name = "childMenuEdit";
            this.childMenuEdit.Size = new System.Drawing.Size(152, 22);
            this.childMenuEdit.Text = "编辑";
            this.childMenuEdit.Click += new System.EventHandler(this.menuEdit_Click);
            // 
            // childMenuDelete
            // 
            this.childMenuDelete.Name = "childMenuDelete";
            this.childMenuDelete.Size = new System.Drawing.Size(152, 22);
            this.childMenuDelete.Text = "删除";
            this.childMenuDelete.Click += new System.EventHandler(this.childMenuDelete_Click);
            // 
            // parentMenu
            // 
            this.parentMenu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.parentMenuEdit,
            this.parentMenuInsert});
            this.parentMenu.Name = "parentMenu";
            this.parentMenu.Size = new System.Drawing.Size(101, 48);
            // 
            // parentMenuEdit
            // 
            this.parentMenuEdit.Name = "parentMenuEdit";
            this.parentMenuEdit.Size = new System.Drawing.Size(100, 22);
            this.parentMenuEdit.Text = "编辑";
            this.parentMenuEdit.Click += new System.EventHandler(this.menuEdit_Click);
            // 
            // parentMenuInsert
            // 
            this.parentMenuInsert.Name = "parentMenuInsert";
            this.parentMenuInsert.Size = new System.Drawing.Size(100, 22);
            this.parentMenuInsert.Text = "插入";
            this.parentMenuInsert.Click += new System.EventHandler(this.parentMenuInsert_Click);
            // 
            // splitContainer1
            // 
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
            this.splitContainer2.Panel2.Controls.Add(this.propertyGrid);
            this.splitContainer2.Size = new System.Drawing.Size(634, 311);
            this.splitContainer2.SplitterDistance = 246;
            this.splitContainer2.TabIndex = 0;
            this.splitContainer2.TabStop = false;
            // 
            // treeView
            // 
            this.treeView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.treeView.HideSelection = false;
            this.treeView.Location = new System.Drawing.Point(0, 0);
            this.treeView.Name = "treeView";
            this.treeView.Size = new System.Drawing.Size(246, 311);
            this.treeView.TabIndex = 0;
            this.treeView.BeforeSelect += new System.Windows.Forms.TreeViewCancelEventHandler(this.treeView_BeforeSelect);
            this.treeView.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeView_AfterSelect);
            this.treeView.NodeMouseClick += new System.Windows.Forms.TreeNodeMouseClickEventHandler(this.treeView_NodeMouseClick);
            // 
            // propertyGrid
            // 
            this.propertyGrid.Dock = System.Windows.Forms.DockStyle.Fill;
            this.propertyGrid.Location = new System.Drawing.Point(0, 0);
            this.propertyGrid.Name = "propertyGrid";
            this.propertyGrid.Size = new System.Drawing.Size(384, 311);
            this.propertyGrid.TabIndex = 0;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(634, 416);
            this.Controls.Add(this.splitContainer1);
            this.Name = "MainForm";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.childMenu.ResumeLayout(false);
            this.parentMenu.ResumeLayout(false);
            this.splitContainer1.Panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.splitContainer2.Panel1.ResumeLayout(false);
            this.splitContainer2.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer2)).EndInit();
            this.splitContainer2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.SplitContainer splitContainer2;
        private System.Windows.Forms.TreeView treeView;
        private System.Windows.Forms.ContextMenuStrip parentMenu;
        private System.Windows.Forms.ToolStripMenuItem parentMenuInsert;
        private System.Windows.Forms.PropertyGrid propertyGrid;
        private System.Windows.Forms.ContextMenuStrip childMenu;
        private System.Windows.Forms.ToolStripMenuItem childMenuDelete;
        private System.Windows.Forms.ToolStripMenuItem childMenuEdit;
        private System.Windows.Forms.ToolStripMenuItem parentMenuEdit;
    }
}

