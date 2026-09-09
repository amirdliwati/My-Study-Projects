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

public partial class teacheruserconrol_addformquastion : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        SqlDataSource1.DataBind();
        if (ListBox1.SelectedIndex == -1)
        {
            ListBox1.DataBind();
            if (ListBox1.Items.Count > 0)
                ListBox1.SelectedIndex = 0;
        }
        SqlDataSource2.DataBind();
        if (ListBox2.SelectedIndex == -1)
        {
            ListBox2.DataBind();
            if (ListBox2.Items.Count > 0)
                ListBox2.SelectedIndex = 0;
        }
        SqlDataSource3.DataBind();
        if (ListBox3.SelectedIndex == -1)
        {
            ListBox3.DataBind();
            if (ListBox3.Items.Count > 0)
                ListBox3.SelectedIndex = 0;
        }
        SqlDataSource4.DataBind();
        if (RadioButtonList1.SelectedIndex==-1)
        {
            RadioButtonList1.DataBind();
            if (RadioButtonList1.Items.Count > 0)
                RadioButtonList1.SelectedIndex = 0;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RequiredFieldValidator1.IsValid && RequiredFieldValidator2.IsValid)
        {
            dataaccess da = new dataaccess();
            da.opencon();
            Label1.Text = da.addformquastion(int.Parse(RadioButtonList1.SelectedValue), int.Parse(ListBox3.SelectedValue));
            da.closecon();
            Label1.Visible = true;

        }
    }
}
