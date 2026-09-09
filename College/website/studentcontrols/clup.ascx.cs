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

public partial class studentcontrols_clup : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.DataBind();
        if (ListBox1.Items.Count==0)
        {
            ListBox1.DataBind();
            if (ListBox1.Items.Count > 0)
                ListBox1.SelectedIndex = 0;
        }
        SqlDataSource2.DataBind();
        if (ListBox2.Items.Count == 0)
        {
            ListBox2.DataBind();
            if (ListBox2.Items.Count > 0)
                ListBox2.SelectedIndex = 0;
        }
        Panel1.Visible = false;
        if (Session["usertype"] != null)
            if (Session["usertype"].ToString() == "student")
                Panel1.Visible = true;
        Label2.Visible = false;
        if (ListBox1.Items.Count>0)
        ListBox1.Rows = ListBox1.Items.Count;
    if (ListBox2.Items.Count > 0)
        ListBox2.Rows = ListBox2.Items.Count;
        SqlDataSource3.DataBind();
        SqlDataSource4.DataBind();
        SqlDataSource5.DataBind();
        GridView1.DataBind();
        GridView2.DataBind();
        GridView3.DataBind();

    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataSource2.DataBind();
        ListBox2.DataBind();
        if (ListBox2.Items.Count > 0)
            ListBox2.SelectedIndex = 0;
        SqlDataSource3.DataBind();
        SqlDataSource4.DataBind();
        SqlDataSource5.DataBind();
        GridView1.DataBind();
        GridView2.DataBind();
        GridView3.DataBind();
    }
    protected void ListBox2_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        SqlDataSource3.DataBind();
        SqlDataSource4.DataBind();
        SqlDataSource5.DataBind();
        GridView1.DataBind();
        GridView2.DataBind();
        GridView3.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RequiredFieldValidator1.IsValid && Session["usertype"] != null)
            if (Session["usertype"].ToString() == "student")
        {
            string active = "not active";
            dataaccess da = new dataaccess();
            da.opencon();
            Label2.Text = da.addreply(TextBox2.Text, DateTime.Now, active, int.Parse(ListBox2.SelectedValue), int.Parse(Session["id"].ToString()));
            da.closecon();
            Label2.Visible = true;
        }
    }
}
