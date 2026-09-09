using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_controles_Add_publisherl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.PublishersTableAdapter dt = new AWPDataSetTableAdapters.PublishersTableAdapter();
            dt.SP_IN_Publishers(TextBox1.Text, TextBox2.Text);
            Label1.Visible = true;
        }
        catch
        { }
    }
}