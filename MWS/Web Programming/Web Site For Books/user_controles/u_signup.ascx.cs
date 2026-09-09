using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_controles_u_signup : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.loginTableAdapter ta = new AWPDataSetTableAdapters.loginTableAdapter();
            ta.SP_IN_Login(TextBox4.Text, TextBox5.Text, "Custmer");

            int s = Convert.ToInt32(ta.select_login_ID());

            AWPDataSetTableAdapters.Customers1TableAdapter ta1 = new AWPDataSetTableAdapters.Customers1TableAdapter();
            ta1.SP_IN_Customer(TextBox7.Text, TextBox3.Text, Convert.ToInt32(DropDownList3.SelectedValue), Calendar1.SelectedDate, Convert.ToInt32(DropDownList2.SelectedValue), Convert.ToInt32(DropDownList4.SelectedValue), Convert.ToInt32(DropDownList5.SelectedValue), s, TextBox8.Text);
            
            Label10.Text = "Saved";
            Label10.Visible = true;
        
        }

        catch
        { Label10.Text = "False";
        Label10.Visible = true;
        }
    }
}