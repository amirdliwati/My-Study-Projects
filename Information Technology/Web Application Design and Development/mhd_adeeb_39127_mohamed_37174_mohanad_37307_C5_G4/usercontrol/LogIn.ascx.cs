using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Net;

public partial class usercontrol_login : System.Web.UI.UserControl
{
    int x = 0;
    protected void Button1_Click(object sender, EventArgs e)
    {
        HttpCookie cook = new HttpCookie("nam");
        cook["student"] = TextBox1.Text;
        Response.Cookies.Add(cook);
        cook.Expires = DateTime.Now.AddYears(1);
        
        if (DropDownList1.SelectedValue == "Staff")
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            con.Open();

            SqlCommand cmd = new SqlCommand("select * from admin where ((pass=@pass) and (username=@username))", con);
            SqlParameter p = new SqlParameter("@username", TextBox1.Text);
            SqlParameter p2 = new SqlParameter("@pass", TextBox2.Text);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.Add(p);
            cmd.Parameters.Add(p2);
            SqlDataReader myreader = cmd.ExecuteReader();
            if (myreader.HasRows == false)
            {

                Label10.Visible = true;

                Label10.Text = "User Name Or Password Is Wrong";

                con.Close();

            }
            else
            {

                Response.Redirect("Admin.aspx");


            }
            TextBox1.Text = "";
            TextBox2.Text = "";
        }

        else if (DropDownList1.SelectedValue == "Student")
        {

            SqlConnection con2 = new SqlConnection();
            con2.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

            con2.Open();

            SqlCommand cmd2 = new SqlCommand("select user_n , pass from register where ( (user_n=@user_n)and (pass=@pass))", con2);
            SqlParameter p3 = new SqlParameter("@user_n", TextBox1.Text);
            SqlParameter p4 = new SqlParameter("@pass", TextBox2.Text);
            cmd2.CommandType = CommandType.Text;
            cmd2.Parameters.Add(p3);
            cmd2.Parameters.Add(p4);
            SqlDataReader myreader2 = cmd2.ExecuteReader();
            if (myreader2.HasRows == false)
            {

                Label10.Visible = true;

                Label10.Text = "User Name Or Password Is Wrong";
                con2.Close();
            }

            else
            {
                Response.Redirect("Student.aspx");
            }
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }
   
}
