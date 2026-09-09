using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_controles_Add_books : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
        if (RadioButtonList1.SelectedValue == "Add Author")
        {
           
                AWPDataSetTableAdapters.AuthorsTableAdapter dt = new AWPDataSetTableAdapters.AuthorsTableAdapter();
                dt.SP_IN_Authors(TextBox1.Text, Convert.ToInt32(DropDownList1.SelectedValue), TextBox2.Text);
                Label1.Visible = true;          
            
        }

        
        
        }
        catch
            { }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string x = RadioButtonList1.SelectedValue;
        switch (x)
        {
            case "Add Author": { Button1.Visible = true; Button2.Visible = false; DropDownList2.Visible = false; } break;
            case "Select Author": { Button1.Visible = false; Button2.Visible = true; DropDownList2.Visible = true; } break;

        }

    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            if (RadioButtonList1.SelectedValue == "Select Author")
        {
            AWPDataSetTableAdapters.BooksTableAdapter dt1 = new AWPDataSetTableAdapters.BooksTableAdapter();
            int x = Convert.ToInt32(dt1.select_max_id_book());
            AWPDataSetTableAdapters.BookAuthorsTableAdapter dt2 = new AWPDataSetTableAdapters.BookAuthorsTableAdapter();
            dt2.SP_IN_BookAuthor(x, Convert.ToInt32(DropDownList2.SelectedValue));
            Label1.Visible = true;
        }
            
        }
        catch
        { }
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
        DropDownList1.SelectedValue = "1";
        Label1.Visible = false;
    }
}