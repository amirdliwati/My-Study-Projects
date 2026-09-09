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

public partial class usercontrol_AddCourse : System.Web.UI.UserControl
{ 
    
    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand("select c_id from course where c_name = @c_name", con);
        com.CommandType = CommandType.Text;
        SqlParameter p = new SqlParameter("@c_name", TextBox2.Text);
        com.Parameters.Add(p);
        SqlDataReader reader = com.ExecuteReader();
        if (reader.HasRows == false)
        {
            reader.Close();
            com.CommandText = "insert into course (pro_id , sem , code , c_name , n_session , price , m_n , n_c , [open] ) values (@pro_id , @sem , @code , @c_name1 , @n_session , @price , @m_n , 0 , @open) ";
            com.Connection = con;
            com.CommandType = CommandType.Text;
            SqlParameter p1 = new SqlParameter("@pro_id", Convert.ToInt32(DropDownList1.SelectedValue));
            SqlParameter p2 = new SqlParameter("@sem", TextBox6.Text);
            SqlParameter p3 = new SqlParameter("@code", TextBox1.Text);
            SqlParameter p4 = new SqlParameter("@c_name1", TextBox2.Text);
            SqlParameter p5 = new SqlParameter("@n_session", Convert.ToInt32(TextBox3.Text));
            SqlParameter p6 = new SqlParameter("@price", Convert.ToInt32(TextBox4.Text));
            SqlParameter p7 = new SqlParameter("@m_n", Convert.ToInt32(TextBox5.Text));
            SqlParameter p8 = new SqlParameter("@open", CheckBox1.Checked);
            com.Parameters.Add(p1);
            com.Parameters.Add(p2);
            com.Parameters.Add(p3);
            com.Parameters.Add(p4);
            com.Parameters.Add(p5);
            com.Parameters.Add(p6);
            com.Parameters.Add(p7);
            com.Parameters.Add(p8);
            SqlDataReader myreader = com.ExecuteReader();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
        }
        con.Close();
    }





    
}
