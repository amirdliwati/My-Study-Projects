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

public partial class Student : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cook = Request.Cookies["nam"];

        if (cook != null)
        {
            Label2.Text = "Welcome" + "  " + cook["student"];


        }

        SqlConnection con1 = new SqlConnection();
        con1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        con1.Open();
        SqlCommand cmd1 = new SqlCommand("select id_s from register where (user_n=@a)", con1);

        SqlParameter p3 = new SqlParameter("@a", cook["student"]);

        cmd1.CommandType = CommandType.Text;
        cmd1.Parameters.Add(p3);

        SqlDataReader myre = cmd1.ExecuteReader();
        while(myre.Read())
            Label3.Text = Convert.ToString(myre[0]);
    }

    
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        con.Open();
        SqlCommand com2 = new SqlCommand("select c_id from student_course where (c_id = @c_id2) and (id_s = @id_s2) ", con);
        com2.CommandType = CommandType.Text;
        SqlParameter p3 = new SqlParameter("@id_s2", Convert.ToInt32(Label3.Text));
        SqlParameter p4 = new SqlParameter("@c_id2", GridView1.SelectedValue);
        com2.Parameters.Add(p3);
        com2.Parameters.Add(p4);
        SqlDataReader reader = com2.ExecuteReader();
        if (reader.HasRows == true)
        {
            Label1.Text = "This Course Has been Registerd Please Choose Another Course ";
            con.Close();
        }
        else
        {
            GridView2.Visible = true;
            Button1.Visible = true;
            reader.Close();
            com2.CommandText = "UPDATE course SET n_c = n_c + 1  WHERE(c_id = @x)";
            com2.CommandType = CommandType.Text;
            SqlParameter p10 = new SqlParameter("@x",GridView1.SelectedValue);
            com2.Parameters.Add(p10);
            reader = com2.ExecuteReader();
            reader.Close();
            SqlCommand com = new SqlCommand("insert into student_course values (@id_s , @c_id)", con);
            com.CommandType = CommandType.Text;
            SqlParameter p = new SqlParameter("@id_s", Convert.ToInt32(Label3.Text));
            SqlParameter p2 = new SqlParameter("@c_id", GridView1.SelectedValue);
            com.Parameters.Add(p);
            com.Parameters.Add(p2);
            reader = com.ExecuteReader();
            con.Close();
            Response.Redirect("Student.aspx");
            Button1.Visible = true;
        }
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        con.Open();
        SqlCommand com = new SqlCommand("delete from student_course where (id_s = @id_s) and (c_id=@c_id)",con);
        SqlParameter p = new SqlParameter("@id_s", Convert.ToInt32(Label3.Text));
        SqlParameter p2 = new SqlParameter("@c_id", GridView2.SelectedValue);
        com.Parameters.Add(p);
        com.Parameters.Add(p2);
        SqlDataReader reader = com.ExecuteReader();
        reader.Close();
        com.CommandText = "UPDATE course SET n_c = n_c - 1  WHERE(c_id = @x)";
        com.CommandType = CommandType.Text;
        SqlParameter p10 = new SqlParameter("@x", GridView2.SelectedValue);
        com.Parameters.Add(p10);
        reader = com.ExecuteReader();
        
        con.Close();
        Response.Redirect("Student.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "Courses Have Been Registerd successfully";
        GridView2.Visible = false;
        Button1.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}
