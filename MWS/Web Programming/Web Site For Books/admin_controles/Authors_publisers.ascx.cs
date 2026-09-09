using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_controles_Authors_publisers : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.AuthorsTableAdapter dt = new AWPDataSetTableAdapters.AuthorsTableAdapter();
            AWPDataSet.AuthorsDataTable da = dt.GetData(Convert.ToInt32(DropDownList2.SelectedValue));

            TextBox1.Text = da.Rows[0]["AuthorName"].ToString();
            DropDownList1.SelectedValue = da.Rows[0]["NationalityID"].ToString();
            TextBox2.Text = da.Rows[0]["AuthorDescription"].ToString();
        }
        catch { }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "NO";
        TextBox3.Text = "";
        TextBox4.Text = "";
        DropDownList1.SelectedValue = "1";
        Label1.Visible = false;
        Label2.Visible = false;
        Label3.Visible = false;
        Label4.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.AuthorsTableAdapter dt = new AWPDataSetTableAdapters.AuthorsTableAdapter();
            dt.SP_IN_Authors(TextBox1.Text, Convert.ToInt32(DropDownList1.SelectedValue), TextBox2.Text);
            Label1.Visible = true;
        }
        catch
        { }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
       
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.PublishersTableAdapter dt = new AWPDataSetTableAdapters.PublishersTableAdapter();
            dt.SP_IN_Publishers(TextBox1.Text, TextBox2.Text);
            Label2.Visible = true;
        }
        catch
        { }
    }
    protected void Button5_Click1(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.AuthorsTableAdapter dt = new AWPDataSetTableAdapters.AuthorsTableAdapter();
            dt.SP_UP_Authors(TextBox1.Text, Convert.ToInt32(DropDownList1.SelectedValue), TextBox2.Text, Convert.ToInt32(DropDownList2.SelectedValue));
            Label1.Visible = true;
        }
        catch { }
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.AuthorsTableAdapter dt = new AWPDataSetTableAdapters.AuthorsTableAdapter();
            dt.SP_DE_Authors(Convert.ToInt32(DropDownList2.SelectedValue));
            Label3.Visible = true;
        }
        catch { }
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.PublishersTableAdapter dt = new AWPDataSetTableAdapters.PublishersTableAdapter();
            dt.SP_UP_Publishers(TextBox3.Text, TextBox4.Text, Convert.ToInt32(DropDownList3.SelectedValue));
            Label2.Visible = true;
        }
        catch { }

    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.PublishersTableAdapter dt = new AWPDataSetTableAdapters.PublishersTableAdapter();
            dt.SP_DE_Publishers(Convert.ToInt32(DropDownList3.SelectedValue));
            Label4.Visible = true;
        }
        catch { }
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.PublishersTableAdapter dt = new AWPDataSetTableAdapters.PublishersTableAdapter();
            AWPDataSet.PublishersDataTable da = dt.GetData(Convert.ToInt32(DropDownList3.SelectedValue));

            TextBox3.Text = da.Rows[0]["PublisherName"].ToString();
            TextBox4.Text = da.Rows[0]["PublisherDescription"].ToString();
        }
        catch { }
    }
}