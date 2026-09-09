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

public partial class usercontrol_AddProgram : System.Web.UI.UserControl
{

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        con.Open();
        SqlCommand mycom = new SqlCommand("select pro_id from program where pro_n = @pro_n", con);
        mycom.CommandType = CommandType.Text;
        SqlParameter p3 = new SqlParameter("@pro_n", TextBox1.Text);
        mycom.Parameters.Add(p3);
        SqlDataReader myreader = mycom.ExecuteReader();
        if (myreader.HasRows == false)
        {
            myreader.Close();
            SqlCommand com = new SqlCommand("insert into program (pro_n , pro_des) values (@pro_n , @pro_des)", con);
            com.CommandType = CommandType.Text;
            SqlParameter p = new SqlParameter("@pro_n", TextBox1.Text);
            SqlParameter p1 = new SqlParameter("@pro_des", TextBox2.Text);
            com.Parameters.Add(p);
            com.Parameters.Add(p1);
            SqlDataReader reader = com.ExecuteReader();

            con.Close();
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
        else {
            Label3.Visible = true;
            Label3.Text = "The Program You'r Trying To Add Is Exist!!!";
            con.Close();
        }
    }
}
