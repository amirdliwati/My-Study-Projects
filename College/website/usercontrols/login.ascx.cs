using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class usercontrols_login : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        if (Session["num"] != null)
        if (Session["num"].ToString() == "111111")
            Button1.Enabled = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["num"] == null)
            Session["num"] = "1";
        Session["num"] = Session["num"].ToString() + "1";
        if (Session["num"].ToString() == "111111")
            Button1.Enabled = false;
       
        string connectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        string sql = "";
        if (ListBox1.SelectedValue == "admin")
            sql = "Select aid,username,pass from admin where username = '" + username.Text + "'";
        if (ListBox1.SelectedValue == "teacher")
            sql = "Select tid,username,pass from teacher where username = '" + username.Text + "'";
        if (ListBox1.SelectedValue == "student")
            sql = "Select sid,username,pass from student where username = '" + username.Text + "'";
        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        Label1.Text = "username or password is wrong";
        Label1.Visible = true;
        while (reader.Read())
        {

            if ( reader["pass"].ToString() == pass.Text)
            {
                Label1.Visible = false;
                Session["login"] = "true";
                Session["username"] = reader["username"].ToString();
                Session["usertype"] = ListBox1.SelectedValue;
                Session["id"] = reader.GetInt32(0).ToString();
                if(ListBox1.SelectedValue=="admin")
                Response.Redirect("admin.aspx");
            if (ListBox1.SelectedValue == "teacher")
                Response.Redirect("teacher.aspx");
            if (ListBox1.SelectedValue == "student")
                Response.Redirect("student.aspx");
            
            }
            
        }
        reader.Close();
        con.Close();

    }
}
