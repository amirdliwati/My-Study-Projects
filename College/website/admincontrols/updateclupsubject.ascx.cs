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
public partial class admincontrols_updateclupsubject : System.Web.UI.UserControl
{
    public void fill()
    {
        if (oldtitel.SelectedIndex != -1)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            string sql = "select cbid,subtitel,subtext,date,active,suid from clupsubject where cbid=" + oldtitel.SelectedValue;
            SqlCommand checkcmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = checkcmd.ExecuteReader(CommandBehavior.CloseConnection);

            while (reader.Read())
            {

                if (reader["cbid"].ToString() == oldtitel.SelectedValue)
                {
                    titel.Text = reader["subtitel"].ToString();
                    text.Text = reader["subtext"].ToString();
                    date.Text = reader["date"].ToString();
                    active.SelectedIndex=active.Items.IndexOf(active.Items.FindByValue(reader["active"].ToString()));
                    
                }

            }
            reader.Close();
            con.Close();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        SqlDataSource1.DataBind();
        if (subject.SelectedIndex==-1)
        {
            subject.DataBind();
            if (subject.Items.Count > 0)
                subject.SelectedIndex = 0;
        }
        SqlDataSource2.DataBind();
        if (oldtitel.SelectedIndex==-1)
        {
            oldtitel.DataBind();
            if (oldtitel.Items.Count > 0)
                oldtitel.SelectedIndex = 0;
            fill();
        }
        
    }
    protected void subject_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataSource2.DataBind();
        if (oldtitel.SelectedIndex == -1)
        {
            oldtitel.DataBind();
            if (oldtitel.Items.Count > 0)
                oldtitel.SelectedIndex = 0;
        }
        fill();
    }
    protected void oldtitel_SelectedIndexChanged(object sender, EventArgs e)
    {
        fill();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RequiredFieldValidator1.IsValid && RequiredFieldValidator2.IsValid && RequiredFieldValidator3.IsValid && RegularExpressionValidator1.IsValid)
        {
            dataaccess da = new dataaccess();
            da.opencon();
            Label1.Text = da.updateclupsubject(titel.Text, text.Text, date.Text, active.SelectedValue, int.Parse(subject.SelectedValue), int.Parse(oldtitel.SelectedValue));
            da.closecon();
            Label1.Visible = true;
            fill();
        }
    }
}
