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
public partial class usercontrols_advertising : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string view = "<marquee>";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        string sql = "select titel from advertising where titel<>'' order by date";
        SqlCommand checkcmd = new SqlCommand(sql, con);
        con.Open();
        SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

        while (reader.Read())
        {
            
                view = view+"  :  "+reader["titel"].ToString()+"  :  ";
            

        }
        view =view+ "</marquee>";
        reader.Close();
        con.Close();
        Label1.Text = view;
        
    }
}
