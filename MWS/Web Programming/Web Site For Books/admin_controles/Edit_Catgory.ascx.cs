using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_controles_Edit_Catgory : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.CategoriesTableAdapter dt = new AWPDataSetTableAdapters.CategoriesTableAdapter();
            dt.SP_IN_Categories(TextBox1.Text);
            Label1.Text = "Saved";
        }
        catch { }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.CategoriesTableAdapter dt = new AWPDataSetTableAdapters.CategoriesTableAdapter();
            dt.SP_UP_Categories(TextBox1.Text, Convert.ToInt32(DropDownList1.SelectedValue));
            Label1.Text = "Updated";
        }
        catch { }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.CategoriesTableAdapter dt = new AWPDataSetTableAdapters.CategoriesTableAdapter();
            AWPDataSet.CategoriesDataTable da = dt.GetData(Convert.ToInt32(DropDownList1.SelectedValue));
            TextBox1.Text = da[0]["CategoryName"].ToString();
        }
        catch { }
    }
}