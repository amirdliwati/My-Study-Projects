using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using Sedna.Net;

namespace SednaTest
{
	/// <summary>
	/// Summary description for DocumentNameTextBoxForm.
	/// </summary>
	public class UploadForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.TabControl Pages;
		private System.Windows.Forms.TabPage DocNamePage;
		private System.Windows.Forms.TabPage DocFilePage;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox DocumentNameTextBox;
		private System.Windows.Forms.Button NextButton;
		private System.Windows.Forms.Button Cancel_Button;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.TextBox FileNameTextBox;
		private System.Windows.Forms.Button FindFileButton;
		private System.Windows.Forms.Button XmlDataSource;
		private System.Windows.Forms.OpenFileDialog OpenXmlFileDlg;
		private System.Windows.Forms.Timer FocusControlTimer;
		private System.ComponentModel.IContainer components;

		public UploadForm(SednaSession session)
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			this.session = session;
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
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
            this.Pages = new System.Windows.Forms.TabControl();
            this.DocFilePage = new System.Windows.Forms.TabPage();
            this.FindFileButton = new System.Windows.Forms.Button();
            this.FileNameTextBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.DocNamePage = new System.Windows.Forms.TabPage();
            this.DocumentNameTextBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.NextButton = new System.Windows.Forms.Button();
            this.XmlDataSource = new System.Windows.Forms.Button();
            this.Cancel_Button = new System.Windows.Forms.Button();
            this.OpenXmlFileDlg = new System.Windows.Forms.OpenFileDialog();
            this.FocusControlTimer = new System.Windows.Forms.Timer(this.components);
            this.Pages.SuspendLayout();
            this.DocFilePage.SuspendLayout();
            this.DocNamePage.SuspendLayout();
            this.SuspendLayout();
            // 
            // Pages
            // 
            this.Pages.Appearance = System.Windows.Forms.TabAppearance.FlatButtons;
            this.Pages.Controls.Add(this.DocFilePage);
            this.Pages.Controls.Add(this.DocNamePage);
            this.Pages.Location = new System.Drawing.Point(5, -21);
            this.Pages.Name = "Pages";
            this.Pages.SelectedIndex = 0;
            this.Pages.Size = new System.Drawing.Size(358, 139);
            this.Pages.TabIndex = 0;
            // 
            // DocFilePage
            // 
            this.DocFilePage.Controls.Add(this.FindFileButton);
            this.DocFilePage.Controls.Add(this.FileNameTextBox);
            this.DocFilePage.Controls.Add(this.label2);
            this.DocFilePage.Location = new System.Drawing.Point(4, 25);
            this.DocFilePage.Name = "DocFilePage";
            this.DocFilePage.Size = new System.Drawing.Size(350, 110);
            this.DocFilePage.TabIndex = 1;
            this.DocFilePage.Text = "tabPage1";
            // 
            // FindFileButton
            // 
            this.FindFileButton.Location = new System.Drawing.Point(256, 38);
            this.FindFileButton.Name = "FindFileButton";
            this.FindFileButton.Size = new System.Drawing.Size(46, 25);
            this.FindFileButton.TabIndex = 4;
            this.FindFileButton.Text = "...";
            this.FindFileButton.Click += new System.EventHandler(this.FindFileButton_Click);
            // 
            // FileNameTextBox
            // 
            this.FileNameTextBox.Location = new System.Drawing.Point(10, 40);
            this.FileNameTextBox.Name = "FileNameTextBox";
            this.FileNameTextBox.Size = new System.Drawing.Size(242, 20);
            this.FileNameTextBox.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(7, 19);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(334, 18);
            this.label2.TabIndex = 2;
            this.label2.Text = "Please enter the path and filename of the document to upload:";
            // 
            // DocNamePage
            // 
            this.DocNamePage.Controls.Add(this.DocumentNameTextBox);
            this.DocNamePage.Controls.Add(this.label1);
            this.DocNamePage.Location = new System.Drawing.Point(4, 25);
            this.DocNamePage.Name = "DocNamePage";
            this.DocNamePage.Size = new System.Drawing.Size(350, 110);
            this.DocNamePage.TabIndex = 0;
            // 
            // DocumentNameTextBox
            // 
            this.DocumentNameTextBox.Location = new System.Drawing.Point(12, 38);
            this.DocumentNameTextBox.Name = "DocumentNameTextBox";
            this.DocumentNameTextBox.Size = new System.Drawing.Size(147, 20);
            this.DocumentNameTextBox.TabIndex = 0;
            this.DocumentNameTextBox.Text = "mydata.xml";
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(8, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(217, 18);
            this.label1.TabIndex = 0;
            this.label1.Text = "Please enter a name for the document:";
            // 
            // NextButton
            // 
            this.NextButton.Location = new System.Drawing.Point(177, 132);
            this.NextButton.Name = "NextButton";
            this.NextButton.Size = new System.Drawing.Size(83, 25);
            this.NextButton.TabIndex = 1;
            this.NextButton.Text = "Next >>";
            this.NextButton.Click += new System.EventHandler(this.NextButton_Click);
            // 
            // XmlDataSource
            // 
            this.XmlDataSource.Location = new System.Drawing.Point(9, 132);
            this.XmlDataSource.Name = "XmlDataSource";
            this.XmlDataSource.Size = new System.Drawing.Size(83, 25);
            this.XmlDataSource.TabIndex = 0;
            this.XmlDataSource.Text = "Back";
            this.XmlDataSource.Visible = false;
            this.XmlDataSource.Click += new System.EventHandler(this.BackButton_Click);
            // 
            // Cancel_Button
            // 
            this.Cancel_Button.Location = new System.Drawing.Point(266, 132);
            this.Cancel_Button.Name = "Cancel_Button";
            this.Cancel_Button.Size = new System.Drawing.Size(93, 25);
            this.Cancel_Button.TabIndex = 2;
            this.Cancel_Button.Text = "Cancel";
            this.Cancel_Button.Click += new System.EventHandler(this.CancelButton_Click);
            // 
            // OpenXmlFileDlg
            // 
            this.OpenXmlFileDlg.DefaultExt = "xml";
            this.OpenXmlFileDlg.Filter = "*.xml (Xml Files)|*.xml|*.* (All Files)|*.*";
            this.OpenXmlFileDlg.Title = "Open XML File";
            // 
            // FocusControlTimer
            // 
            this.FocusControlTimer.Interval = 10;
            this.FocusControlTimer.Tick += new System.EventHandler(this.FocusControlTimer_Tick);
            // 
            // UploadForm
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(364, 164);
            this.Controls.Add(this.NextButton);
            this.Controls.Add(this.Pages);
            this.Controls.Add(this.XmlDataSource);
            this.Controls.Add(this.Cancel_Button);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "UploadForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Upload Document";
            this.Load += new System.EventHandler(this.UploadForm_Load);
            this.Pages.ResumeLayout(false);
            this.DocFilePage.ResumeLayout(false);
            this.DocFilePage.PerformLayout();
            this.DocNamePage.ResumeLayout(false);
            this.DocNamePage.PerformLayout();
            this.ResumeLayout(false);

		}
		#endregion

		SednaSession session = null;
		
		private void NextButton_Click(object sender, System.EventArgs e)
		{
			if (Pages.SelectedTab==DocFilePage)
			{
				if (FileNameTextBox.Text=="" || !System.IO.File.Exists(FileNameTextBox.Text))
					MessageBox.Show(this, "Please enter a valid filename");
				else
					// we're done...
					StartUpLoad();
			}
			else if (Pages.SelectedTab==DocNamePage)
			{
				if (DocumentNameTextBox.Text=="")
					MessageBox.Show(this, "Please enter a document name");
				else
				{
					Pages.SelectedTab = DocFilePage;
					NextButton.Text = "Finish";
				}
			}
		}

		void StartUpLoad()
		{
			string file = FileNameTextBox.Text;
			try
			{
				Cursor.Current = Cursors.WaitCursor;
				session.LoadDocument(file, DocumentNameTextBox.Text);
                session.CommitTransaction();
				MessageBox.Show(this, "Upload was successful");
				Close();
			}
			catch (Exception ex)
			{
				MessageBox.Show(this, "Upload failed: " + ex.Message);
			}
			finally
			{
				Cursor.Current = Cursors.Default;
			}
		}

		private void BackButton_Click(object sender, System.EventArgs e)
		{
			if (Pages.SelectedTab==DocFilePage)
			{
				Pages.SelectedTab=DocNamePage;
				NextButton.Text = "Next";
			}
		}

		private void UploadForm_Load(object sender, System.EventArgs e)
		{
			FocusControlTimer.Enabled = true;
		}

		private void FindFileButton_Click(object sender, System.EventArgs e)
		{
            OpenXmlFileDlg.InitialDirectory = doc.xmlFilePath;
			OpenXmlFileDlg.FileName = FileNameTextBox.Text;
			if (OpenXmlFileDlg.ShowDialog(this)==DialogResult.OK)
			{
				string file = OpenXmlFileDlg.FileName;
				FileNameTextBox.Text = file;
			}
		}

		private void CancelButton_Click(object sender, System.EventArgs e)
		{
			Close();
		}

		private void FocusControlTimer_Tick(object sender, System.EventArgs e)
		{
			Pages.Focus();
			DocumentNameTextBox.Focus();
			FocusControlTimer.Enabled = false;
		}
	}
}
