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

public partial class usercontrol_Register : System.Web.UI.UserControl
{
    int x = 0;   
    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlConnection mycon = new SqlConnection();
        mycon.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

        mycon.Open();
        SqlCommand mycom = new SqlCommand("select max(id_s) from register", mycon);
        mycom.CommandType = CommandType.Text;
        SqlDataReader myreader = mycom.ExecuteReader();
        while (myreader.Read())
        {
            x = Convert.ToInt32(myreader[0]) + 1;

        }
        myreader.Close();
        TextBox4.Text = TextBox4.Text + "_" + x.ToString();
        mycom.CommandText = "insert into register values (@full_n , @user_n , @pass , @email , @pro_id)";
        mycom.Connection = mycon;

        SqlParameter p = new SqlParameter("@full_n", TextBox3.Text);
        SqlParameter p1 = new SqlParameter("@user_n", TextBox4.Text);
        SqlParameter p2 = new SqlParameter("@pass", TextBox5.Text);
        SqlParameter p3 = new SqlParameter("@email", TextBox7.Text);
        SqlParameter p4 = new SqlParameter("@pro_id", Convert.ToInt32(DropDownList2.SelectedValue));
        mycom.CommandType = CommandType.Text;
        mycom.Parameters.Add(p);
        mycom.Parameters.Add(p1);
        mycom.Parameters.Add(p2);
        mycom.Parameters.Add(p3);
        mycom.Parameters.Add(p4);

        mycom.ExecuteReader();
        mycon.Close();
        Label10.Text = TextBox4.Text + "    " + "تم الحفظ بنجاح واسم المستخدم هو";
        Label10.Visible = true;
        
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        
    }
}
