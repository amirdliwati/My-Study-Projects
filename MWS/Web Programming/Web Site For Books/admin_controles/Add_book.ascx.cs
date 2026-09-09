using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_controles_Add_book : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.BooksTableAdapter dt0 = new AWPDataSetTableAdapters.BooksTableAdapter();            
            int id = Convert.ToInt32( dt0.select_max_id_book()) + 1;
            if (dt0.select_max_id_book() == DBNull.Value)
            { id = 1; }
            else
            {
                string pathe_book = @"C:\Web Site For Books\Images_book\" + id.ToString() + ".jpg";
                fileImage.SaveAs(pathe_book);
                AWPDataSetTableAdapters.BooksTableAdapter dt = new AWPDataSetTableAdapters.BooksTableAdapter();
                dt.SP_IN_Book(TextBox1.Text, TextBox6.Text, TextBox2.Text, Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToDateTime(Calendar1.SelectedDate), TextBox3.Text, "~/Images_book/" + id.ToString() + ".jpg", Convert.ToDecimal(TextBox4.Text), Convert.ToInt32(TextBox7.Text), Convert.ToInt32(DropDownList2.SelectedValue));              
                
            }
            AWPDataSetTableAdapters.BookKeywordsTableAdapter dt1 = new AWPDataSetTableAdapters.BookKeywordsTableAdapter();
            dt1.SP_IN_BookKeywords(Convert.ToInt32(dt0.select_max_id_book()), TextBox5.Text);
            Label1.Visible = true;
        }
        catch
        { }
    }


    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox7.Text = "";
        DropDownList1.SelectedValue = "1";
        DropDownList2.SelectedValue = "1";
        fileImage.FileName.Clone();
        Label1.Visible = false;
        Label2.Text = "";
        

        
    }
}