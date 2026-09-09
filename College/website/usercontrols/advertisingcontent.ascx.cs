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

public partial class usercontrols_advertisingcontent : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataSource1.DataBind();
        if (ListBox1.SelectedIndex == -1)
        {
            ListBox1.DataBind();
            if (ListBox1.Items.Count > 0)
            {
                ListBox1.SelectedIndex = 0;
                ListBox1.Rows = ListBox1.Items.Count;
            }
            }
            SqlDataSource2.DataBind();
            GridView1.DataBind();

    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataSource2.DataBind();
        GridView1.DataBind();
    }
}
