using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using Sedna.Net;
using System.Xml;
using System.IO;

namespace SednaTest
{


	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class MainForm : System.Windows.Forms.Form
	{
        static int lastRowIndex = -1;
#region Form Controls
        private System.Windows.Forms.Button button1;
        private TabControl tabControl1;
        private TabPage tabSearch;
        private TabPage tabDemo;
        private OpenFileDialog openFileDialog1;
        private CheckBox AlwaysCommitCheckbox;
        private Button InsertDocButton;
        private ComboBox CommandsDropDown;
        private Label label1;
        private Button RunQueryButton;
        private TextBox QueryTextBox;
        private TextBox ResultTextBox;
        private Label label3;
        private Label label5;
        private Button ExitButton;
        private Button CommitTransactionButton;
        private Button RollbackTransaction;
        private GroupBox groupBox1;
        private Button btnFind;
        private Label label16;
        private DataGridView dataGridView1;
        private TabPage tabSettings;
        private Button btnExportData;
        private Button BulkLoadButton;
        private GroupBox grpFolders;
        private Button btnRefreshFolders;
        private TreeView treeFolders;
        private ImageList imageList1;
        private Button btnDeleteFolder;
        private Button btnAddSubFolder;
        private TextBox txtFind;
        private Button btnEdit;
        private PictureBox picEditFile;
        private Button btnCancelEdit;
        private Button btnDelete;
        private Button btnUpdate;
        private Button btnEditFile;
        private TextBox txtEditFolder;
        private Label label17;
        private DateTimePicker dtpEditDate;
        private Label label18;
        private TextBox txtEditDocInfo;
        private Label label19;
        private TextBox txtEditMakerInfo;
        private Label label20;
        private TextBox txtEditName;
        private Label label21;
        private TextBox txtEditID;
        private Label label22;
        private Button btnAdd;
        private TreeView treeView1;
        private LinkLabel lnkFile;
        private DataGridViewTextBoxColumn ID;
        private DataGridViewTextBoxColumn Column1;
        private DataGridViewTextBoxColumn Column2;
        private DataGridViewTextBoxColumn Column3;
        private DataGridViewTextBoxColumn Column4;
        private DataGridViewTextBoxColumn Column5;
        private GroupBox gbEdit;
        private IContainer components;
#endregion

		public MainForm()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null) 
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabSearch = new System.Windows.Forms.TabPage();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnEdit = new System.Windows.Forms.Button();
            this.txtFind = new System.Windows.Forms.TextBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.gbEdit = new System.Windows.Forms.GroupBox();
            this.btnUpdate = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnCancelEdit = new System.Windows.Forms.Button();
            this.btnEditFile = new System.Windows.Forms.Button();
            this.lnkFile = new System.Windows.Forms.LinkLabel();
            this.treeView1 = new System.Windows.Forms.TreeView();
            this.imageList1 = new System.Windows.Forms.ImageList(this.components);
            this.picEditFile = new System.Windows.Forms.PictureBox();
            this.txtEditFolder = new System.Windows.Forms.TextBox();
            this.label17 = new System.Windows.Forms.Label();
            this.dtpEditDate = new System.Windows.Forms.DateTimePicker();
            this.label18 = new System.Windows.Forms.Label();
            this.txtEditDocInfo = new System.Windows.Forms.TextBox();
            this.label19 = new System.Windows.Forms.Label();
            this.txtEditMakerInfo = new System.Windows.Forms.TextBox();
            this.label20 = new System.Windows.Forms.Label();
            this.txtEditName = new System.Windows.Forms.TextBox();
            this.label21 = new System.Windows.Forms.Label();
            this.txtEditID = new System.Windows.Forms.TextBox();
            this.label22 = new System.Windows.Forms.Label();
            this.btnFind = new System.Windows.Forms.Button();
            this.label16 = new System.Windows.Forms.Label();
            this.tabSettings = new System.Windows.Forms.TabPage();
            this.grpFolders = new System.Windows.Forms.GroupBox();
            this.btnDeleteFolder = new System.Windows.Forms.Button();
            this.btnAddSubFolder = new System.Windows.Forms.Button();
            this.btnRefreshFolders = new System.Windows.Forms.Button();
            this.treeFolders = new System.Windows.Forms.TreeView();
            this.btnExportData = new System.Windows.Forms.Button();
            this.BulkLoadButton = new System.Windows.Forms.Button();
            this.tabDemo = new System.Windows.Forms.TabPage();
            this.AlwaysCommitCheckbox = new System.Windows.Forms.CheckBox();
            this.InsertDocButton = new System.Windows.Forms.Button();
            this.CommandsDropDown = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.RunQueryButton = new System.Windows.Forms.Button();
            this.QueryTextBox = new System.Windows.Forms.TextBox();
            this.ResultTextBox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.ExitButton = new System.Windows.Forms.Button();
            this.CommitTransactionButton = new System.Windows.Forms.Button();
            this.RollbackTransaction = new System.Windows.Forms.Button();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.tabControl1.SuspendLayout();
            this.tabSearch.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.gbEdit.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picEditFile)).BeginInit();
            this.tabSettings.SuspendLayout();
            this.grpFolders.SuspendLayout();
            this.tabDemo.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabSearch);
            this.tabControl1.Controls.Add(this.tabSettings);
            this.tabControl1.Controls.Add(this.tabDemo);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(604, 622);
            this.tabControl1.TabIndex = 0;
            // 
            // tabSearch
            // 
            this.tabSearch.Controls.Add(this.btnAdd);
            this.tabSearch.Controls.Add(this.btnEdit);
            this.tabSearch.Controls.Add(this.txtFind);
            this.tabSearch.Controls.Add(this.dataGridView1);
            this.tabSearch.Controls.Add(this.groupBox1);
            this.tabSearch.Controls.Add(this.btnFind);
            this.tabSearch.Controls.Add(this.label16);
            this.tabSearch.Location = new System.Drawing.Point(4, 22);
            this.tabSearch.Name = "tabSearch";
            this.tabSearch.Padding = new System.Windows.Forms.Padding(3);
            this.tabSearch.Size = new System.Drawing.Size(596, 596);
            this.tabSearch.TabIndex = 0;
            this.tabSearch.Text = "Search";
            this.tabSearch.UseVisualStyleBackColor = true;
            this.tabSearch.Enter += new System.EventHandler(this.tabSearch_Enter);
            // 
            // btnAdd
            // 
            this.btnAdd.Location = new System.Drawing.Point(361, 11);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(52, 23);
            this.btnAdd.TabIndex = 3;
            this.btnAdd.Text = "Add";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Location = new System.Drawing.Point(419, 11);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(53, 23);
            this.btnEdit.TabIndex = 4;
            this.btnEdit.Text = "Edit";
            this.btnEdit.UseVisualStyleBackColor = true;
            this.btnEdit.Click += new System.EventHandler(this.button2_Click);
            // 
            // txtFind
            // 
            this.txtFind.Location = new System.Drawing.Point(120, 14);
            this.txtFind.Name = "txtFind";
            this.txtFind.Size = new System.Drawing.Size(158, 20);
            this.txtFind.TabIndex = 1;
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ID,
            this.Column1,
            this.Column2,
            this.Column3,
            this.Column4,
            this.Column5});
            this.dataGridView1.Location = new System.Drawing.Point(8, 40);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.Size = new System.Drawing.Size(580, 164);
            this.dataGridView1.TabIndex = 5;
            this.dataGridView1.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            this.dataGridView1.CellEnter += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellEnter);
            // 
            // ID
            // 
            this.ID.DataPropertyName = "ID";
            this.ID.HeaderText = "ID";
            this.ID.Name = "ID";
            this.ID.ReadOnly = true;
            this.ID.Width = 40;
            // 
            // Column1
            // 
            this.Column1.DataPropertyName = "doc_name";
            this.Column1.HeaderText = "Name";
            this.Column1.Name = "Column1";
            this.Column1.ReadOnly = true;
            this.Column1.Width = 200;
            // 
            // Column2
            // 
            this.Column2.DataPropertyName = "doc_date";
            this.Column2.HeaderText = "Date";
            this.Column2.Name = "Column2";
            this.Column2.ReadOnly = true;
            // 
            // Column3
            // 
            this.Column3.DataPropertyName = "Folder_Name";
            this.Column3.HeaderText = "Folder Name";
            this.Column3.Name = "Column3";
            this.Column3.ReadOnly = true;
            // 
            // Column4
            // 
            this.Column4.DataPropertyName = "File_Name";
            this.Column4.HeaderText = "File Name";
            this.Column4.Name = "Column4";
            this.Column4.ReadOnly = true;
            // 
            // Column5
            // 
            this.Column5.DataPropertyName = "FileFullName";
            this.Column5.HeaderText = "FileFullName";
            this.Column5.Name = "Column5";
            this.Column5.ReadOnly = true;
            this.Column5.Visible = false;
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.gbEdit);
            this.groupBox1.Controls.Add(this.lnkFile);
            this.groupBox1.Controls.Add(this.treeView1);
            this.groupBox1.Controls.Add(this.picEditFile);
            this.groupBox1.Controls.Add(this.txtEditFolder);
            this.groupBox1.Controls.Add(this.label17);
            this.groupBox1.Controls.Add(this.dtpEditDate);
            this.groupBox1.Controls.Add(this.label18);
            this.groupBox1.Controls.Add(this.txtEditDocInfo);
            this.groupBox1.Controls.Add(this.label19);
            this.groupBox1.Controls.Add(this.txtEditMakerInfo);
            this.groupBox1.Controls.Add(this.label20);
            this.groupBox1.Controls.Add(this.txtEditName);
            this.groupBox1.Controls.Add(this.label21);
            this.groupBox1.Controls.Add(this.txtEditID);
            this.groupBox1.Controls.Add(this.label22);
            this.groupBox1.Location = new System.Drawing.Point(8, 210);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(580, 377);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Detials";
            // 
            // gbEdit
            // 
            this.gbEdit.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.gbEdit.Controls.Add(this.btnUpdate);
            this.gbEdit.Controls.Add(this.btnDelete);
            this.gbEdit.Controls.Add(this.btnCancelEdit);
            this.gbEdit.Controls.Add(this.btnEditFile);
            this.gbEdit.Location = new System.Drawing.Point(6, 343);
            this.gbEdit.Name = "gbEdit";
            this.gbEdit.Size = new System.Drawing.Size(568, 28);
            this.gbEdit.TabIndex = 76;
            this.gbEdit.TabStop = false;
            // 
            // btnUpdate
            // 
            this.btnUpdate.Location = new System.Drawing.Point(0, 5);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(75, 23);
            this.btnUpdate.TabIndex = 14;
            this.btnUpdate.Text = "Save";
            this.btnUpdate.UseVisualStyleBackColor = true;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Location = new System.Drawing.Point(81, 5);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(75, 23);
            this.btnDelete.TabIndex = 15;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnCancelEdit
            // 
            this.btnCancelEdit.Location = new System.Drawing.Point(162, 5);
            this.btnCancelEdit.Name = "btnCancelEdit";
            this.btnCancelEdit.Size = new System.Drawing.Size(75, 23);
            this.btnCancelEdit.TabIndex = 16;
            this.btnCancelEdit.Text = "Cancel";
            this.btnCancelEdit.UseVisualStyleBackColor = true;
            this.btnCancelEdit.Click += new System.EventHandler(this.btnCancelEdit_Click_1);
            // 
            // btnEditFile
            // 
            this.btnEditFile.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnEditFile.Location = new System.Drawing.Point(418, 5);
            this.btnEditFile.Name = "btnEditFile";
            this.btnEditFile.Size = new System.Drawing.Size(150, 23);
            this.btnEditFile.TabIndex = 13;
            this.btnEditFile.Text = "Select File";
            this.btnEditFile.UseVisualStyleBackColor = true;
            this.btnEditFile.Click += new System.EventHandler(this.btnEditFile_Click);
            // 
            // lnkFile
            // 
            this.lnkFile.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lnkFile.AutoEllipsis = true;
            this.lnkFile.Location = new System.Drawing.Point(276, 20);
            this.lnkFile.Name = "lnkFile";
            this.lnkFile.Size = new System.Drawing.Size(298, 23);
            this.lnkFile.TabIndex = 75;
            this.lnkFile.TabStop = true;
            this.lnkFile.Text = "Open File";
            this.lnkFile.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.lnkFile_LinkClicked);
            // 
            // treeView1
            // 
            this.treeView1.FullRowSelect = true;
            this.treeView1.HideSelection = false;
            this.treeView1.ImageIndex = 0;
            this.treeView1.ImageList = this.imageList1;
            this.treeView1.Location = new System.Drawing.Point(130, 93);
            this.treeView1.Name = "treeView1";
            this.treeView1.SelectedImageIndex = 0;
            this.treeView1.Size = new System.Drawing.Size(140, 141);
            this.treeView1.TabIndex = 6;
            this.treeView1.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.treeView1_AfterSelect);
            // 
            // imageList1
            // 
            this.imageList1.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageList1.ImageStream")));
            this.imageList1.TransparentColor = System.Drawing.Color.Transparent;
            this.imageList1.Images.SetKeyName(0, "folder");
            this.imageList1.Images.SetKeyName(1, "folder_delete");
            this.imageList1.Images.SetKeyName(2, "folder_add");
            // 
            // picEditFile
            // 
            this.picEditFile.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.picEditFile.BackColor = System.Drawing.Color.LightGray;
            this.picEditFile.Location = new System.Drawing.Point(276, 40);
            this.picEditFile.Name = "picEditFile";
            this.picEditFile.Size = new System.Drawing.Size(298, 300);
            this.picEditFile.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.picEditFile.TabIndex = 74;
            this.picEditFile.TabStop = false;
            // 
            // txtEditFolder
            // 
            this.txtEditFolder.Location = new System.Drawing.Point(6, 161);
            this.txtEditFolder.Name = "txtEditFolder";
            this.txtEditFolder.ReadOnly = true;
            this.txtEditFolder.Size = new System.Drawing.Size(113, 20);
            this.txtEditFolder.TabIndex = 5;
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Location = new System.Drawing.Point(9, 145);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(88, 13);
            this.label17.TabIndex = 4;
            this.label17.Text = "Name The Folder";
            // 
            // dtpEditDate
            // 
            this.dtpEditDate.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpEditDate.Location = new System.Drawing.Point(6, 200);
            this.dtpEditDate.Name = "dtpEditDate";
            this.dtpEditDate.Size = new System.Drawing.Size(93, 20);
            this.dtpEditDate.TabIndex = 8;
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Location = new System.Drawing.Point(9, 184);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(51, 13);
            this.label18.TabIndex = 7;
            this.label18.Text = "The Date";
            // 
            // txtEditDocInfo
            // 
            this.txtEditDocInfo.Location = new System.Drawing.Point(6, 299);
            this.txtEditDocInfo.Multiline = true;
            this.txtEditDocInfo.Name = "txtEditDocInfo";
            this.txtEditDocInfo.Size = new System.Drawing.Size(264, 38);
            this.txtEditDocInfo.TabIndex = 12;
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Location = new System.Drawing.Point(9, 283);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(110, 13);
            this.label19.TabIndex = 11;
            this.label19.Text = "Info About Document";
            // 
            // txtEditMakerInfo
            // 
            this.txtEditMakerInfo.Location = new System.Drawing.Point(6, 240);
            this.txtEditMakerInfo.Multiline = true;
            this.txtEditMakerInfo.Name = "txtEditMakerInfo";
            this.txtEditMakerInfo.Size = new System.Drawing.Size(264, 40);
            this.txtEditMakerInfo.TabIndex = 10;
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.Location = new System.Drawing.Point(9, 224);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(91, 13);
            this.label20.TabIndex = 9;
            this.label20.Text = "Info About Maker";
            // 
            // txtEditName
            // 
            this.txtEditName.Location = new System.Drawing.Point(6, 67);
            this.txtEditName.Name = "txtEditName";
            this.txtEditName.Size = new System.Drawing.Size(263, 20);
            this.txtEditName.TabIndex = 3;
            // 
            // label21
            // 
            this.label21.AutoSize = true;
            this.label21.Location = new System.Drawing.Point(9, 51);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(106, 13);
            this.label21.TabIndex = 2;
            this.label21.Text = "Name The Document";
            // 
            // txtEditID
            // 
            this.txtEditID.Location = new System.Drawing.Point(33, 17);
            this.txtEditID.Name = "txtEditID";
            this.txtEditID.ReadOnly = true;
            this.txtEditID.Size = new System.Drawing.Size(86, 20);
            this.txtEditID.TabIndex = 1;
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.Location = new System.Drawing.Point(9, 20);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(18, 13);
            this.label22.TabIndex = 0;
            this.label22.Text = "ID";
            // 
            // btnFind
            // 
            this.btnFind.Location = new System.Drawing.Point(284, 11);
            this.btnFind.Name = "btnFind";
            this.btnFind.Size = new System.Drawing.Size(72, 23);
            this.btnFind.TabIndex = 2;
            this.btnFind.Text = "Search";
            this.btnFind.UseVisualStyleBackColor = true;
            this.btnFind.Click += new System.EventHandler(this.btnFind_Click);
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(8, 16);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(106, 13);
            this.label16.TabIndex = 0;
            this.label16.Text = "Name The Document";
            // 
            // tabSettings
            // 
            this.tabSettings.Controls.Add(this.grpFolders);
            this.tabSettings.Controls.Add(this.btnExportData);
            this.tabSettings.Controls.Add(this.BulkLoadButton);
            this.tabSettings.Location = new System.Drawing.Point(4, 22);
            this.tabSettings.Name = "tabSettings";
            this.tabSettings.Size = new System.Drawing.Size(596, 596);
            this.tabSettings.TabIndex = 4;
            this.tabSettings.Text = "Setting";
            this.tabSettings.UseVisualStyleBackColor = true;
            this.tabSettings.Enter += new System.EventHandler(this.tabSettings_Enter);
            // 
            // grpFolders
            // 
            this.grpFolders.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.grpFolders.Controls.Add(this.btnDeleteFolder);
            this.grpFolders.Controls.Add(this.btnAddSubFolder);
            this.grpFolders.Controls.Add(this.btnRefreshFolders);
            this.grpFolders.Controls.Add(this.treeFolders);
            this.grpFolders.Location = new System.Drawing.Point(9, 49);
            this.grpFolders.Name = "grpFolders";
            this.grpFolders.Size = new System.Drawing.Size(579, 544);
            this.grpFolders.TabIndex = 17;
            this.grpFolders.TabStop = false;
            this.grpFolders.Text = "Folders";
            // 
            // btnDeleteFolder
            // 
            this.btnDeleteFolder.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnDeleteFolder.ImageKey = "folder_delete";
            this.btnDeleteFolder.ImageList = this.imageList1;
            this.btnDeleteFolder.Location = new System.Drawing.Point(132, 19);
            this.btnDeleteFolder.Name = "btnDeleteFolder";
            this.btnDeleteFolder.Size = new System.Drawing.Size(95, 23);
            this.btnDeleteFolder.TabIndex = 54;
            this.btnDeleteFolder.Text = "Delete Folder";
            this.btnDeleteFolder.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnDeleteFolder.UseVisualStyleBackColor = true;
            this.btnDeleteFolder.Click += new System.EventHandler(this.btnDeleteFolder_Click);
            // 
            // btnAddSubFolder
            // 
            this.btnAddSubFolder.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnAddSubFolder.ImageKey = "folder_add";
            this.btnAddSubFolder.ImageList = this.imageList1;
            this.btnAddSubFolder.Location = new System.Drawing.Point(39, 19);
            this.btnAddSubFolder.Name = "btnAddSubFolder";
            this.btnAddSubFolder.Size = new System.Drawing.Size(87, 23);
            this.btnAddSubFolder.TabIndex = 53;
            this.btnAddSubFolder.Text = "Add Folder";
            this.btnAddSubFolder.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnAddSubFolder.UseVisualStyleBackColor = true;
            this.btnAddSubFolder.Click += new System.EventHandler(this.btnAddSubFolder_Click);
            // 
            // btnRefreshFolders
            // 
            this.btnRefreshFolders.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("btnRefreshFolders.BackgroundImage")));
            this.btnRefreshFolders.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.btnRefreshFolders.Location = new System.Drawing.Point(6, 19);
            this.btnRefreshFolders.Name = "btnRefreshFolders";
            this.btnRefreshFolders.Size = new System.Drawing.Size(27, 23);
            this.btnRefreshFolders.TabIndex = 52;
            this.btnRefreshFolders.UseVisualStyleBackColor = true;
            this.btnRefreshFolders.Click += new System.EventHandler(this.btnRefreshFolders_Click);
            // 
            // treeFolders
            // 
            this.treeFolders.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.treeFolders.HideSelection = false;
            this.treeFolders.ImageIndex = 0;
            this.treeFolders.ImageList = this.imageList1;
            this.treeFolders.LabelEdit = true;
            this.treeFolders.Location = new System.Drawing.Point(6, 48);
            this.treeFolders.Name = "treeFolders";
            this.treeFolders.SelectedImageIndex = 0;
            this.treeFolders.Size = new System.Drawing.Size(567, 490);
            this.treeFolders.TabIndex = 16;
            this.treeFolders.BeforeLabelEdit += new System.Windows.Forms.NodeLabelEditEventHandler(this.treeFolders_BeforeLabelEdit);
            this.treeFolders.AfterLabelEdit += new System.Windows.Forms.NodeLabelEditEventHandler(this.treeFolders_AfterLabelEdit);
            // 
            // btnExportData
            // 
            this.btnExportData.Location = new System.Drawing.Point(129, 13);
            this.btnExportData.Name = "btnExportData";
            this.btnExportData.Size = new System.Drawing.Size(115, 29);
            this.btnExportData.TabIndex = 15;
            this.btnExportData.Text = "&Export Document...";
            this.btnExportData.Click += new System.EventHandler(this.btnExportData_Click);
            // 
            // BulkLoadButton
            // 
            this.BulkLoadButton.Location = new System.Drawing.Point(8, 12);
            this.BulkLoadButton.Name = "BulkLoadButton";
            this.BulkLoadButton.Size = new System.Drawing.Size(115, 29);
            this.BulkLoadButton.TabIndex = 14;
            this.BulkLoadButton.Text = "&Upload Document...";
            this.BulkLoadButton.Click += new System.EventHandler(this.BulkLoadButton_Click);
            // 
            // tabDemo
            // 
            this.tabDemo.Controls.Add(this.AlwaysCommitCheckbox);
            this.tabDemo.Controls.Add(this.InsertDocButton);
            this.tabDemo.Controls.Add(this.CommandsDropDown);
            this.tabDemo.Controls.Add(this.label1);
            this.tabDemo.Controls.Add(this.RunQueryButton);
            this.tabDemo.Controls.Add(this.QueryTextBox);
            this.tabDemo.Controls.Add(this.ResultTextBox);
            this.tabDemo.Controls.Add(this.label3);
            this.tabDemo.Controls.Add(this.label5);
            this.tabDemo.Controls.Add(this.ExitButton);
            this.tabDemo.Controls.Add(this.CommitTransactionButton);
            this.tabDemo.Controls.Add(this.RollbackTransaction);
            this.tabDemo.Location = new System.Drawing.Point(4, 22);
            this.tabDemo.Name = "tabDemo";
            this.tabDemo.Size = new System.Drawing.Size(596, 596);
            this.tabDemo.TabIndex = 3;
            this.tabDemo.Text = "Demo";
            this.tabDemo.UseVisualStyleBackColor = true;
            // 
            // AlwaysCommitCheckbox
            // 
            this.AlwaysCommitCheckbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.AlwaysCommitCheckbox.Checked = true;
            this.AlwaysCommitCheckbox.CheckState = System.Windows.Forms.CheckState.Checked;
            this.AlwaysCommitCheckbox.Location = new System.Drawing.Point(375, 162);
            this.AlwaysCommitCheckbox.Name = "AlwaysCommitCheckbox";
            this.AlwaysCommitCheckbox.Size = new System.Drawing.Size(211, 16);
            this.AlwaysCommitCheckbox.TabIndex = 23;
            this.AlwaysCommitCheckbox.Text = "Automatically Commit Transactions";
            // 
            // InsertDocButton
            // 
            this.InsertDocButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.InsertDocButton.Location = new System.Drawing.Point(543, 2);
            this.InsertDocButton.Name = "InsertDocButton";
            this.InsertDocButton.Size = new System.Drawing.Size(42, 22);
            this.InsertDocButton.TabIndex = 22;
            this.InsertDocButton.Text = "Insert";
            this.InsertDocButton.Click += new System.EventHandler(this.InsertDocButton_Click);
            // 
            // CommandsDropDown
            // 
            this.CommandsDropDown.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.CommandsDropDown.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.CommandsDropDown.DropDownWidth = 300;
            this.CommandsDropDown.Location = new System.Drawing.Point(296, 3);
            this.CommandsDropDown.Name = "CommandsDropDown";
            this.CommandsDropDown.Size = new System.Drawing.Size(244, 21);
            this.CommandsDropDown.TabIndex = 21;
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(183, 8);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(112, 13);
            this.label1.TabIndex = 20;
            this.label1.Text = "Common Commands:";
            // 
            // RunQueryButton
            // 
            this.RunQueryButton.Location = new System.Drawing.Point(10, 158);
            this.RunQueryButton.Name = "RunQueryButton";
            this.RunQueryButton.Size = new System.Drawing.Size(105, 29);
            this.RunQueryButton.TabIndex = 18;
            this.RunQueryButton.Text = "&Run Query";
            this.RunQueryButton.Click += new System.EventHandler(this.RunQueryButton_Click);
            // 
            // QueryTextBox
            // 
            this.QueryTextBox.AcceptsReturn = true;
            this.QueryTextBox.AcceptsTab = true;
            this.QueryTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.QueryTextBox.Font = new System.Drawing.Font("Lucida Console", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.QueryTextBox.Location = new System.Drawing.Point(8, 27);
            this.QueryTextBox.Multiline = true;
            this.QueryTextBox.Name = "QueryTextBox";
            this.QueryTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Horizontal;
            this.QueryTextBox.Size = new System.Drawing.Size(579, 127);
            this.QueryTextBox.TabIndex = 12;
            this.QueryTextBox.WordWrap = false;
            // 
            // ResultTextBox
            // 
            this.ResultTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ResultTextBox.Font = new System.Drawing.Font("Lucida Console", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ResultTextBox.Location = new System.Drawing.Point(8, 209);
            this.ResultTextBox.Multiline = true;
            this.ResultTextBox.Name = "ResultTextBox";
            this.ResultTextBox.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.ResultTextBox.Size = new System.Drawing.Size(579, 343);
            this.ResultTextBox.TabIndex = 11;
            this.ResultTextBox.WordWrap = false;
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(10, 8);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(92, 15);
            this.label3.TabIndex = 14;
            this.label3.Text = "Query Input:";
            // 
            // label5
            // 
            this.label5.Location = new System.Drawing.Point(10, 193);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(92, 15);
            this.label5.TabIndex = 15;
            this.label5.Text = "Query Result:";
            // 
            // ExitButton
            // 
            this.ExitButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.ExitButton.Location = new System.Drawing.Point(510, 562);
            this.ExitButton.Name = "ExitButton";
            this.ExitButton.Size = new System.Drawing.Size(77, 29);
            this.ExitButton.TabIndex = 17;
            this.ExitButton.Text = "E&xit";
            this.ExitButton.Click += new System.EventHandler(this.ExitButton_Click);
            // 
            // CommitTransactionButton
            // 
            this.CommitTransactionButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.CommitTransactionButton.Location = new System.Drawing.Point(224, 564);
            this.CommitTransactionButton.Name = "CommitTransactionButton";
            this.CommitTransactionButton.Size = new System.Drawing.Size(135, 29);
            this.CommitTransactionButton.TabIndex = 16;
            this.CommitTransactionButton.Text = "&Commit Transaction";
            this.CommitTransactionButton.Click += new System.EventHandler(this.CommitTransactionButton_Click);
            // 
            // RollbackTransaction
            // 
            this.RollbackTransaction.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.RollbackTransaction.Location = new System.Drawing.Point(365, 563);
            this.RollbackTransaction.Name = "RollbackTransaction";
            this.RollbackTransaction.Size = new System.Drawing.Size(135, 29);
            this.RollbackTransaction.TabIndex = 19;
            this.RollbackTransaction.Text = "&Rollback Transaction";
            this.RollbackTransaction.Click += new System.EventHandler(this.RollbackTransaction_Click);
            // 
            // MainForm
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(604, 622);
            this.Controls.Add(this.tabControl1);
            this.Name = "MainForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "ADE_Project";
            this.Closing += new System.ComponentModel.CancelEventHandler(this.MainForm_Closing);
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.tabControl1.ResumeLayout(false);
            this.tabSearch.ResumeLayout(false);
            this.tabSearch.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.gbEdit.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.picEditFile)).EndInit();
            this.tabSettings.ResumeLayout(false);
            this.grpFolders.ResumeLayout(false);
            this.tabDemo.ResumeLayout(false);
            this.tabDemo.PerformLayout();
            this.ResumeLayout(false);

		}
		#endregion

		SednaSession session = null;
		string[] commands = new string[] { "UPDATE delete ", "UPDATE delete_undeep ", "UPDATE rename ", "UPDATE insert ", "CREATE DOCUMENT ", "DROP DOCUMENT ", "RETRIEVE METADATA FOR DOCUMENTS", "RETRIEVE DESCRIPTIVE SCHEMA FOR DOCUMENT \"\"", "CREATE COLLECTION ", "DROP COLLECTION ", "CREATE INDEX title ON nodes_path BY key_path AS type", "DROP INDEX " };
		
		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
            Info f = new Info();
            f.Show();

            System.Diagnostics.Process proc = new System.Diagnostics.Process();
            proc.EnableRaisingEvents = false;
            proc.StartInfo.CreateNoWindow=true;
            proc.StartInfo.UseShellExecute=false;

            f.ShowInfo("Starting Sedna ...");
            proc.StartInfo.FileName = "se_gov";
            proc.Start();
            proc.WaitForExit();

            try
            {
                f.ShowInfo("Creating Database ...");
                proc.StartInfo.FileName = "se_cdb";
                proc.StartInfo.Arguments = "mydata";
                proc.Start();
                proc.WaitForExit();
            }
            catch
            {
            }

            f.ShowInfo("Starting Database ...");
            proc.StartInfo.FileName = "se_sm";
            proc.StartInfo.Arguments = "mydata";
            proc.Start();
            proc.WaitForExit();
            f.Hide();

			Application.Run(new MainForm());

            f.Show();
            f.ShowInfo("Shutting down database");
            //proc = new System.Diagnostics.Process();
            //proc.EnableRaisingEvents = false;
            proc.StartInfo.FileName = "se_smsd";
            proc.StartInfo.Arguments = "mydata";
            proc.Start();
            proc.WaitForExit();

            f.ShowInfo("Shutting down Sedna");
            proc.StartInfo.FileName = "se_stop";
            proc.StartInfo.Arguments = "";
            proc.Start();
            proc.WaitForExit();
            f.Close();
		}

		private void MainForm_Load(object sender, System.EventArgs e)
		{
            tabControl1.TabPages.RemoveByKey("tabDemo");

            Login();

            if (!Users.isSuperAdmin())
                tabControl1.TabPages.RemoveByKey("tabSettings");

            if (Users.isUser())
            {
                btnAdd.Visible = !Users.isUser();
                btnEdit.Visible = !Users.isUser();
                gbEdit.Visible = false;
            }
            ShowCurrentDoc();
            //SetEdit(false);
		}

		void Login()
		{
			Login login = new Login();
			if (login.ShowDialog(this)==DialogResult.OK)
				session = login.GetSession();
			else
				Application.Exit();

            doc.session = session;
		}

		void ReportError(string title, Exception ex)
		{
			string message = title + Environment.NewLine + ex.Message + " (" + ex.GetType().Name + ")";
			MessageBox.Show(this, message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
			ResultTextBox.Text = "ERROR: " + message;
		}

		private void BulkLoadButton_Click(object sender, System.EventArgs e)
		{
			UploadForm form = new UploadForm(session);
			form.ShowDialog(this);
		}

		private void RunQueryButton_Click(object sender, System.EventArgs e)
		{
			try
			{
				QueryResult res = session.Execute(QueryTextBox.Text);
				if (res==null)
					ResultTextBox.Text = "Executed successfully";
				else
					ResultTextBox.Text = res.GetCompleteResult();
				
				if (session.InTransaction && AlwaysCommitCheckbox.Checked)
					session.CommitTransaction();
			}
			catch (Exception ex)
			{
				ReportError("Unable to execute query or update", ex);
			}
			QueryTextBox.SelectAll();
			QueryTextBox.Focus();
		
		}

		private void CommitTransactionButton_Click(object sender, System.EventArgs e)
		{
			try
			{
				session.CommitTransaction();
				MessageBox.Show(this, "Transaction Committed", "Successfull", MessageBoxButtons.OK, MessageBoxIcon.Information);
			}
			catch (Exception ex)
			{
				ReportError("Unable to commit transaction", ex);
			}
		}

		private void RollbackTransaction_Click(object sender, System.EventArgs e)
		{
			
			try
			{
				throw new NotImplementedException("Rollback is disabled (not implemented on server at time of release)");
				session.RollbackTransaction();
				MessageBox.Show(this, "Transaction rolled back", "Successfull", MessageBoxButtons.OK, MessageBoxIcon.Information);
			}
			catch (Exception ex)
			{
				ReportError("Unable to rollback transaction", ex);
			}
		}

		private void ExitButton_Click(object sender, System.EventArgs e)
		{
			Close();
		}

		private void InsertDocButton_Click(object sender, System.EventArgs e)
		{
			if (CommandsDropDown.Text!="") 
			{
				QueryTextBox.SelectedText = CommandsDropDown.Text;
				QueryTextBox.SelectionStart = QueryTextBox.SelectionStart + CommandsDropDown.Text.Length;
				QueryTextBox.SelectionLength = 0;
				QueryTextBox.Focus();
			}
		}

		private void MainForm_Closing(object sender, System.ComponentModel.CancelEventArgs e)
		{
			if (session.InTransaction)
			{
				DialogResult res = MessageBox.Show(this, "A transaction is still open in this session. Commit the transaction?", "Transaction Pending", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
				if (res==DialogResult.Yes)
				{
					try
					{
						session.CommitTransaction();
					}
					catch (Exception ex)
					{
						ReportError("Error committing transaction", ex);
					}	
				}
				else if (res==DialogResult.Cancel)
				{
					e.Cancel = true;
					return;
				}
			}
			try
			{
                ExportData(doc.xmlFilePath + "\\" + doc.xmlFileName);

				session.Close();
			}
			catch (Exception ex)
			{
				ReportError("Error closing connection", ex);
			}
		}

        private void button1_Click(object sender, EventArgs e)
        {

        }


        private void RefreshGrid()
        {
            try
            {
                int r = -1;

                System.Collections.Generic.List<doc> c = doc.Search(txtFind.Text);
                dataGridView1.DataSource = c;

                /*
                string s = "doc('mydata.xml')/documents/document[name_doc/text()[contains(., '" + txtFind.Text + "')]]";
                QueryResult res = session.Execute(s);
                if (res == null)
                    MessageBox.Show("successfully");
                else
                    ResultTextBox.Text = res.GetCompleteResult();

                if (session.InTransaction && AlwaysCommitCheckbox.Checked)
                    session.CommitTransaction();

                XmlDocument doc = new XmlDocument();
                string nod = "<s>" + ResultTextBox.Text + "</s>";
                doc.LoadXml(nod);
                //XmlNode node = doc.SelectSingleNode("//document[name_doc/text()= '" + txtFind.Text + "' ]");

                string[] det = new string[6];
                dataGridView1.Rows.Clear();
                foreach (XmlNode n in doc.SelectNodes("//document"))
                {
                    det[0] = n.ChildNodes[0].InnerText;
                    det[1] = n.ChildNodes[1].InnerText;
                    det[2] = n.ChildNodes[5].InnerText;

                    dataGridView1.Rows.Add(det);

                    if (det[1] == txtEditName.Text)
                        r = dataGridView1.Rows.Count - 1;
                }
                 * */
                if (r >= 0)
                    dataGridView1.CurrentCell = dataGridView1.Rows[r].Cells["ID"];
            }
            catch (Exception ex)
            {
                ReportError("Unable to execute query or update", ex);
            }


            ShowCurrentDoc();

        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            RefreshGrid();
        }

        private void ShowCurrentDoc()
        {
            SetEdit(false);
            if (dataGridView1.CurrentRow != null)
            {
                lastRowIndex = dataGridView1.CurrentRow.Index;
                try
                {
                    try
                    {
                        int i = int.Parse(dataGridView1.CurrentRow.Cells["ID"].Value.ToString());
                        doc d = new doc(i);

                        txtEditID.Text = d.id.ToString();
                        txtEditName.Text = d.doc_name;

                        dtpEditDate.Value = d.doc_date;
                        //txtEditDate.Text = d.doc_date.ToString();

                        txtEditDocInfo.Text = d.doc_info;
                        txtEditMakerInfo.Text = d.issue_info;
                        txtEditFolder.Text = d.folder_name;

                        lnkFile.Enabled = d.FileFullName != "";
                        lnkFile.Text = d.file_name;
                        lnkFile.Tag = d.FileFullName;
                        picEditFile.ImageLocation = d.FileFullName;
                    }
                    catch (Exception ex)
                    {
                        ReportError("Unable to execute query or update", ex);
                    }

                    return;

                    //string s = "doc('mydata.xml')/documents/document[ID=" + dataGridView1.CurrentRow.Cells[0].Value + "]";
                    //QueryResult res = session.Execute(s);
                    ///*
                    //if (res == null)
                    //    MessageBox.Show("successfully");
                    //else
                    //    ResultTextBox.Text = res.GetCompleteResult();

                    //if (session.InTransaction && AlwaysCommitCheckbox.Checked)
                    //    session.CommitTransaction();
                    //*/

                    //XmlDocument doc = new XmlDocument();
                    //string nod = "<s>" + res.GetCompleteResult() + "</s>";
                    //doc.LoadXml(nod);
                    ////XmlNode node = doc.SelectSingleNode("//document[name_doc/text()= '" + dataGridView1[1, dataGridView1.CurrentRow.Index].Value.ToString() + "' ]");

                    //string[] det = new string[7];

                    //foreach (XmlNode n in doc.SelectNodes("//document"))
                    //{
                    //    det[2] = n.ChildNodes[2].InnerText;
                    //    textBox2.Text = det[2].ToString();
                    //    det[3] = n.ChildNodes[3].InnerText;
                    //    textBox3.Text = det[3].ToString();
                    //    det[4] = n.ChildNodes[4].InnerText;
                    //    textBox1.Text = det[4].ToString();
                    //    det[6] = n.ChildNodes[6].InnerText;
                    //    pictureBox1.ImageLocation = det[6].ToString();
                    //}
                }
                catch (Exception ex)
                {
                    ReportError("Unable to execute query or update", ex);
                }
            }
            else
            {
                lastRowIndex = -1;

                txtEditID.Text = "";
                txtEditName.Text = "";

                dtpEditDate.Value = DateTime.Today;

                txtEditDocInfo.Text = "";
                txtEditMakerInfo.Text = "";
                txtEditFolder.Text = "";
                lnkFile.Enabled = false;

                picEditFile.ImageLocation = "";

                //textBox2.Text = "";
                //textBox3.Text = "";
                //textBox1.Text = "";
                //pictureBox1.ImageLocation = "";
            }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //ShowCurrentDoc();
        }
        

        private void btnEditFile_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            picEditFile.ImageLocation = openFileDialog1.FileName.ToString();
        }

        private void button9_Click(object sender, EventArgs e)
        {
            

        
           

        }



        private void delete_doc()
        {

            try
            {
                doc.Delete(int.Parse(txtEditID.Text));
            }
            catch (Exception ex)
            {
                ReportError("Unable to execute query or update", ex);
            }
        
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Are you sure you want to delete this document?", "Delete Document", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == System.Windows.Forms.DialogResult.Yes)
            {
                delete_doc();
                RefreshGrid();
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            bool done = true;
            doc d ;
            if (txtEditID.Text != "")
                d = new doc(int.Parse(txtEditID.Text));
            else
                d = new doc();

            d.doc_name=txtEditName.Text;
            d.doc_date=dtpEditDate.Value ;
            d.doc_info=txtEditDocInfo.Text;
            d.issue_info=txtEditMakerInfo.Text;
            d.folder_name=txtEditFolder.Text;

            d.Save(openFileDialog1.FileName);

            if (txtEditID.Text == "")
                txtFind.Text = txtEditName.Text;
            RefreshGrid();
            //SetEdit(false);
            return;
            try
            {
                /*
                DirectoryInfo dir1 = new DirectoryInfo(docsPath + "\\" + textBox15.Text);
                dir1.Delete(true);
                */

                string s = "update delete doc('mydata.xml')/documents/document[ID=" + txtEditID.Text + "]";
                QueryResult res = session.Execute(s);
                if (res == null)
                    ResultTextBox.Text = "Executed successfully";
                else
                    ResultTextBox.Text = res.GetCompleteResult();

                //if (session.InTransaction && AlwaysCommitCheckbox.Checked)
                //    session.CommitTransaction();
                //}
                //catch (Exception ex)
                //{
                //    ReportError("Unable to execute query or update", ex);
                //}


                string pathfolder = "";
                //try
                //{
                DirectoryInfo dir2 = new DirectoryInfo(doc.docsPath + "\\" + txtEditFolder.Text);
                if (!dir2.Exists)
                    dir2.Create();
                pathfolder = dir2.FullName;

                FileInfo f = new FileInfo(openFileDialog1.FileName.ToString());
                string pathimg = pathfolder + @"\" + f.Name;
                f.CopyTo(pathimg);

                s = "UPDATE insert <document> " + "<ID>" + txtEditID.Text + "</ID>" +
                    "<name_doc>" + txtEditName.Text + "</name_doc>" +
                    "<info_doc1>" + txtEditDocInfo.Text + "</info_doc1>" +
                    "<info_doc2>" + txtEditMakerInfo.Text + "</info_doc2>" +
                    "<name_folder>" + txtEditFolder.Text + "</name_folder>" +
                    "<date_doc>" + dtpEditDate.Value + "</date_doc>" +
                    "<path_doc>" + pathimg + "</path_doc>" +
                    "</document> into doc('mydata.xml')/documents";
                QueryResult res2 = session.Execute(s);


                if (session.InTransaction && AlwaysCommitCheckbox.Checked)
                    session.CommitTransaction();

                
                if (res2 == null)
                    MessageBox.Show("Update successfully");
                else
                    ResultTextBox.Text = res2.GetCompleteResult();

            }
            catch (Exception ex)
            {
                done = false;
                if (session.InTransaction)
                    session.RollbackTransaction();
                ReportError("Unable to execute query or update", ex);
            }

            if (done)
            {
                //EmptyControls();
                if (txtEditID.Text == "")
                {
                    txtFind.Text = txtEditName.Text;
                }
                //ShowCurrentDoc();
                RefreshGrid();
            }
        }

        private bool ExportData(string FileName)
        {
            bool b = true;
            try
            {
                string s = "doc('mydata.xml')";
                QueryResult res = session.Execute(s);
                if (res == null)
                    MessageBox.Show("No data found");
                else
                {
                    //ResultTextBox.Text = res.GetCompleteResult();
                    using (System.IO.StreamWriter file = new System.IO.StreamWriter(FileName))
                    {
                        file.Write(res.GetCompleteResult());
                    }
                }
            }
            catch (Exception ex)
            {
                b = false;
                throw ex;
            }
            return b;
        }

        private void btnExportData_Click(object sender, EventArgs e)
        {
            if (ExportData(doc.xmlFilePath + "\\" + doc.xmlFileName))
                MessageBox.Show("Exported Successfully");
        }

        private void btnRefreshFolders_Click(object sender, EventArgs e)
        {
            fillFoldersTree(treeFolders);
        }

        private void fillFoldersTree(TreeView trv)
        {
            trv.Nodes.Clear();
            TreeNode n = trv.Nodes.Add(doc.docsPath, "Docs");
            n.ImageKey = "folder";
            FillFolders(trv, doc.docsPath);
            n.Expand();            
        }


        private void FillFolders(TreeView trv, string folder)
        {
            FillFolders(trv, folder, false);
        }
        private void FillFolders(TreeView trv, string folder, bool AddOnly)
        {
            DirectoryInfo di = new DirectoryInfo(folder);
            TreeNode[] parentNode = trv.Nodes.Find(di.FullName, true);
            TreeNodeCollection c;
            if (parentNode.Length==0)
                c = trv.Nodes;
            else
                c = parentNode[0].Nodes;

            foreach (System.IO.DirectoryInfo d in di.GetDirectories())
            {
                if (!AddOnly || c[d.FullName] == null)
                {
                    c.Add(d.FullName, d.Name).ImageKey = "folder";
                    FillFolders(trv, d.FullName);
                }
            }
        }


        private void treeFolders_AfterLabelEdit(object sender, NodeLabelEditEventArgs e)
        {
            if (e.Label==null)
            {
                if(e.Node.Name=="")
                    treeFolders.Nodes.Remove(e.Node);
                return;
            }

            try
            {
                if (e.Node.Name == "")
                {
                    string nKey = e.Node.Parent.Name + "\\" + e.Label;
                    DirectoryInfo f = Directory.CreateDirectory(nKey);
                    //e.Node.Name = nKey;
                    e.Node.EndEdit(false);
                    FillFolders(treeFolders, e.Node.Parent.Name, true);
                    treeFolders.Nodes.Remove(e.Node);
                }
                else
                {
                    DirectoryInfo f = new DirectoryInfo(e.Node.Name);
                    f.MoveTo(e.Node.Parent.Name + "\\" + e.Label);
                }
            }
            catch (Exception ex)
            {
                e.CancelEdit = true;
                MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                e.Node.EndEdit(false);
            }
        }

        private void btnDeleteFolder_Click(object sender, EventArgs e)
        {
            if (treeFolders.SelectedNode != null && treeFolders.SelectedNode != treeFolders.Nodes[0])
            {

                if (MessageBox.Show("Are you sure to delete this folder and its contents?", "Delete Folder", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == System.Windows.Forms.DialogResult.Yes)
                    try
                    {
                        Directory.Delete(treeFolders.SelectedNode.Name, true);
                        treeFolders.Nodes.Remove(treeFolders.SelectedNode);
                    }
                    catch
                    {
                    }
            }
        }

        private void btnAddSubFolder_Click(object sender, EventArgs e)
        {
            if (treeFolders.SelectedNode == null)
                treeFolders.SelectedNode = treeFolders.Nodes[0];

            TreeNode n = treeFolders.SelectedNode.Nodes.Add("", "New Folder");
            treeFolders.SelectedNode = n;
            n.BeginEdit();

        }

        private void treeFolders_BeforeLabelEdit(object sender, NodeLabelEditEventArgs e)
        {
            if (e.Node==treeFolders.Nodes[0])
                e.CancelEdit = true;
        }

        private void tabSettings_Enter(object sender, EventArgs e)
        {
            fillFoldersTree(treeFolders);
        }

        private void button2_Click(object sender, EventArgs e)
        {

            if (dataGridView1.CurrentRow != null)
            {
                try
                {
                    int i = int.Parse(dataGridView1.CurrentRow.Cells["ID"].Value.ToString());
                    doc d = new doc(i);

                    //tabControl1.SelectedTab = tabEdit;
                    //tabEdit.Focus();


                    txtEditID.Text = d.id.ToString();
                    txtEditName.Text = d.doc_name;
                    
                    dtpEditDate.Value = d.doc_date;
                    //txtEditDate.Text = d.doc_date.ToString();

                    txtEditDocInfo.Text = d.doc_info;
                    txtEditMakerInfo.Text = d.issue_info;
                    txtEditFolder.Text = d.folder_name;

                    picEditFile.ImageLocation = d.FileFullName;

                    SetEdit(true);
                }
                catch (Exception ex)
                {
                    ReportError("Unable to execute query or update", ex);
                }
            }

        }

        private void btnCancelEdit_Click(object sender, EventArgs e)
        {
            tabControl1.SelectedTab = tabSearch;
        }

        private void EmptyControls()
        {
            txtEditID.Text = "";
            txtEditName.Text = "";
            txtEditDocInfo.Text = "";
            txtEditMakerInfo.Text = "";
            txtEditFolder.Text = "";
            //txtEditDate.Text = "";
            dtpEditDate.Value = DateTime.Today;
            //txtEditFolderOld.Text = "";
            picEditFile.ImageLocation = "";
            lnkFile.Tag = "";
            lnkFile.Text = "";
            lnkFile.Enabled = false;
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            EmptyControls();
            SetEdit(true);
        }

        private void SetEdit(bool Editable)
        {
            openFileDialog1.FileName = "";

            btnUpdate.Enabled = Editable;
            btnDelete.Enabled = Editable && txtEditID.Text != "";
            btnCancelEdit.Enabled = Editable;
            btnEditFile.Enabled = Editable;

            txtEditName.ReadOnly = !Editable;
            txtEditDocInfo.ReadOnly = !Editable;
            txtEditMakerInfo.ReadOnly = !Editable;
            //txtEditFolder.ReadOnly = !Editable;
            treeView1.Enabled = Editable;
            dtpEditDate.Enabled = Editable;

            if (Editable)
                txtEditName.Focus();

            TreeNode n = FindNodeByName(treeView1.Nodes,doc.docsPath +"\\"+ txtEditFolder.Text);
            if (n != null)
            {
                treeView1.SelectedNode = n;
                n.EnsureVisible();
            }
        }
        private TreeNode FindNodeByName(TreeNodeCollection nc, string nodeName)
        {
            foreach (TreeNode n in nc)
            {
                if (n.Name.ToUpper() == nodeName.ToUpper())
                {
                    return n;
                    break;
                }
                if (n.Nodes != null)
                {
                    TreeNode x = FindNodeByName(n.Nodes, nodeName);
                    if (x != null)
                    {
                        return x;
                        break;
                    }
                }
            }
            return null;
        }

        private void btnCancelEdit_Click_1(object sender, EventArgs e)
        {
            //SetEdit(false);
            if (MessageBox.Show("Do you want to cancel the changes?", "Cancel Changes", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == System.Windows.Forms.DialogResult.Yes)

            ShowCurrentDoc();
        }

        private void btnSelectFolder_Click(object sender, EventArgs e)
        {
            fillFoldersTree( treeView1 );
        }

        private void treeView1_AfterSelect(object sender, TreeViewEventArgs e)
        {
            if (treeView1.SelectedNode != treeView1.Nodes[0])
                txtEditFolder.Text = treeView1.SelectedNode.FullPath.Substring(treeView1.Nodes[0].Text.Length + 1);
        }

        private void tabSearch_Enter(object sender, EventArgs e)
        {
            fillFoldersTree(treeView1);
        }

        private void lnkFile_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            System.Diagnostics.Process proc = new System.Diagnostics.Process();
            proc.EnableRaisingEvents = false;
            proc.StartInfo.CreateNoWindow = false;
            proc.StartInfo.UseShellExecute = true;

            proc.StartInfo.FileName = lnkFile.Tag.ToString();
            //proc.StartInfo.Arguments = lnkFile.Text;             
            proc.Start();
            //proc.WaitForExit();
        }

        private void dataGridView1_CellEnter(object sender, DataGridViewCellEventArgs e)
        {

            if (e.RowIndex != lastRowIndex)
                ShowCurrentDoc();
        }
	}
}
