using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using Sedna.Net;

namespace TheServer
{
	/// <summary>
	/// Summary description for Login.
	/// </summary>
	public class Login : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox ServerTextBox;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.TextBox DatabaseTextBox;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.ComboBox UserTextBox;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Button CancelButton;
		private System.Windows.Forms.TextBox PasswordTextBox;
		private System.Windows.Forms.Button LoginButton;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Login()
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Login));
            this.label1 = new System.Windows.Forms.Label();
            this.ServerTextBox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.DatabaseTextBox = new System.Windows.Forms.TextBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label4 = new System.Windows.Forms.Label();
            this.UserTextBox = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.CancelButton = new System.Windows.Forms.Button();
            this.LoginButton = new System.Windows.Forms.Button();
            this.PasswordTextBox = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(21, 86);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(66, 17);
            this.label1.TabIndex = 6;
            this.label1.Text = "Server";
            // 
            // ServerTextBox
            // 
            this.ServerTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ServerTextBox.Location = new System.Drawing.Point(104, 83);
            this.ServerTextBox.Name = "ServerTextBox";
            this.ServerTextBox.Size = new System.Drawing.Size(264, 20);
            this.ServerTextBox.TabIndex = 7;
            this.ServerTextBox.Text = "localhost";
            this.ServerTextBox.TextChanged += new System.EventHandler(this.ServerTextBox_TextChanged);
            // 
            // label2
            // 
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(131, 154);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(242, 17);
            this.label2.TabIndex = 0;
            this.label2.Text = "Please enter your login information";
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(21, 117);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(77, 17);
            this.label3.TabIndex = 8;
            this.label3.Text = "Database";
            // 
            // DatabaseTextBox
            // 
            this.DatabaseTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.DatabaseTextBox.BackColor = System.Drawing.Color.LightPink;
            this.DatabaseTextBox.Location = new System.Drawing.Point(104, 117);
            this.DatabaseTextBox.Name = "DatabaseTextBox";
            this.DatabaseTextBox.Size = new System.Drawing.Size(266, 20);
            this.DatabaseTextBox.TabIndex = 9;
            this.DatabaseTextBox.Text = "Employee1";
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.panel1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("panel1.BackgroundImage")));
            this.panel1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.panel1.Location = new System.Drawing.Point(379, 12);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(166, 122);
            this.panel1.TabIndex = 5;
            // 
            // label4
            // 
            this.label4.Location = new System.Drawing.Point(20, 27);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(62, 17);
            this.label4.TabIndex = 1;
            this.label4.Text = "User Name";
            // 
            // UserTextBox
            // 
            this.UserTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.UserTextBox.Items.AddRange(new object[] {
            "guest"});
            this.UserTextBox.Location = new System.Drawing.Point(106, 23);
            this.UserTextBox.Name = "UserTextBox";
            this.UserTextBox.Size = new System.Drawing.Size(191, 21);
            this.UserTextBox.TabIndex = 2;
            this.UserTextBox.Text = "SYSTEM";
            // 
            // label5
            // 
            this.label5.Location = new System.Drawing.Point(20, 57);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(71, 17);
            this.label5.TabIndex = 3;
            this.label5.Text = "Password";
            // 
            // CancelButton
            // 
            this.CancelButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.CancelButton.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.CancelButton.Location = new System.Drawing.Point(345, 148);
            this.CancelButton.Name = "CancelButton";
            this.CancelButton.Size = new System.Drawing.Size(92, 28);
            this.CancelButton.TabIndex = 11;
            this.CancelButton.Text = "Cancel";
            // 
            // LoginButton
            // 
            this.LoginButton.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.LoginButton.Location = new System.Drawing.Point(20, 148);
            this.LoginButton.Name = "LoginButton";
            this.LoginButton.Size = new System.Drawing.Size(92, 28);
            this.LoginButton.TabIndex = 12;
            this.LoginButton.Text = "Login";
            this.LoginButton.Click += new System.EventHandler(this.LoginButton_Click);
            // 
            // PasswordTextBox
            // 
            this.PasswordTextBox.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.PasswordTextBox.Location = new System.Drawing.Point(106, 57);
            this.PasswordTextBox.Name = "PasswordTextBox";
            this.PasswordTextBox.PasswordChar = '*';
            this.PasswordTextBox.Size = new System.Drawing.Size(191, 20);
            this.PasswordTextBox.TabIndex = 4;
            this.PasswordTextBox.Text = "MANAGER";
            // 
            // Login
            // 
            this.AcceptButton = this.LoginButton;
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(564, 180);
            this.Controls.Add(this.PasswordTextBox);
            this.Controls.Add(this.CancelButton);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.ServerTextBox);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.DatabaseTextBox);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.UserTextBox);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.LoginButton);
            this.Name = "Login";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Login";
            this.Load += new System.EventHandler(this.Login_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

		}
		#endregion

		private SednaSession session;

		private SednaSession AttemptLogin()
		{
			try
			{
				Cursor.Current = Cursors.WaitCursor;
				return SednaSession.CreateSession(ServerTextBox.Text, DatabaseTextBox.Text, UserTextBox.Text, PasswordTextBox.Text);
			}
			catch (System.Net.Sockets.SocketException ex)
			{
				MessageBox.Show(this, "Unable to contact the server." + Environment.NewLine + Environment.NewLine  + ex.Message + " (" + ex.GetType().Name + ")", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
			}
			catch (Exception ex)
			{
				MessageBox.Show(this, "Unable to login: " + ex.Message + " (" + ex.GetType().Name + ")", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
			}
			finally
			{
				Cursor.Current = Cursors.Default;
			}
			return null;
		}
		
		internal SednaSession GetSession()
		{	
			return session;
		}
		
		private void DatabaseTextBox_DropDown(object sender, System.EventArgs e)
		{
			// try to connect to the server and get a list of databases.
			SednaSession session = AttemptLogin();
			if (session!=null)
			{
				session.Close();
			}
		}

		private void LoginButton_Click(object sender, System.EventArgs e)
		{
			session = AttemptLogin();
			if (session!=null)
			{
				DialogResult = DialogResult.OK;
				Hide();
			}
		}

		private void Login_Load(object sender, System.EventArgs e)
		{
            
		}

		private void ServerTextBox_TextChanged(object sender, System.EventArgs e)
		{
		
		}
	}
}
