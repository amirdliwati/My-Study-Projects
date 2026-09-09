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
using System.Web.Configuration;
public partial class admincontrols_updateteacher : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.DataBind();
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        Boolean check = true;
        string sql = "select username from teacher where tid<> " + GridView1.DataKeyNames.GetValue(0).ToString();
        SqlCommand checkcmd = new SqlCommand(sql, con);
        con.Open();
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader["username"].ToString() == args.Value.ToString())
            {
                check = false;

            }

        }
        reader.Close();
        con.Close();
        args.IsValid = check;
    }
    protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        Boolean check = true;
        string sql = "select email from teacher where tid<> " + GridView1.DataKeyNames.GetValue(0).ToString();
        SqlCommand checkcmd = new SqlCommand(sql, con);
        con.Open();
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader["email"].ToString() == args.Value.ToString())
            {
                check = false;

            }

        }
        reader.Close();
        con.Close();
        args.IsValid = check;
    }
    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        Boolean check = true;
        string sql = "select phon from teacher where tid<> " + GridView1.DataKeyNames.GetValue(0).ToString();
        SqlCommand checkcmd = new SqlCommand(sql, con);
        con.Open();
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {

            if (reader["phon"].ToString() == args.Value.ToString())
            {
                check = false;

            }

        }
        reader.Close();
        con.Close();
        args.IsValid = check;
    }
}
