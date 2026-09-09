using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;


public partial class admin_controles_Edit_book : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.BooksTableAdapter dt = new AWPDataSetTableAdapters.BooksTableAdapter();
            AWPDataSet.BooksDataTable da = dt.GetData(Convert.ToInt32(DropDownList3.SelectedValue));

            AWPDataSetTableAdapters.BookKeywordsTableAdapter dt1 = new AWPDataSetTableAdapters.BookKeywordsTableAdapter();
            AWPDataSet.BookKeywordsDataTable da1 = dt1.GetData(Convert.ToInt32(DropDownList3.SelectedValue));

            TextBox1.Text = da.Rows[0]["ISBN"].ToString();
            TextBox2.Text = da.Rows[0]["Abstract"].ToString();
            TextBox3.Text = da.Rows[0]["BookThumbnail"].ToString();
            TextBox4.Text = da.Rows[0]["BookPrice"].ToString();
            TextBox5.Text = da1.Rows[0]["Keyword"].ToString();
            TextBox6.Text = da.Rows[0]["BookTitle"].ToString();
            TextBox7.Text = da.Rows[0]["ReadCount"].ToString();
            img1.ImageUrl = da.Rows[0]["BookCover"].ToString();
            Calendar1.SelectedDate = Convert.ToDateTime(da.Rows[0]["PublishDate"]);
            DropDownList1.SelectedValue = da.Rows[0]["PublisherID"].ToString();
            DropDownList1.SelectedValue = da.Rows[0]["CategoryID"].ToString();
        }
        catch { }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (fileImage.HasFile == true)
            {
                FileInfo f = new FileInfo(@"C:\Web Site For Books\Images_book\" + DropDownList3.SelectedValue + ".jpg");
                if (f.Exists)
                {
                    f.Delete();
                    string pathe_book = @"C:\Web Site For Books\Images_book\" + DropDownList3.SelectedValue + ".jpg";
                    fileImage.SaveAs(pathe_book);

                }
            }
            else
            {


                AWPDataSetTableAdapters.BooksTableAdapter dt = new AWPDataSetTableAdapters.BooksTableAdapter();
                dt.SP_UP_Book(TextBox1.Text, TextBox6.Text, TextBox2.Text, Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToDateTime(Calendar1.SelectedDate), TextBox3.Text, "~/Images_book/" + DropDownList3.SelectedValue + ".jpg", Convert.ToDecimal(TextBox4.Text), Convert.ToInt32(TextBox7.Text), Convert.ToInt32(DropDownList2.SelectedValue), Convert.ToInt32(DropDownList3.SelectedValue));

            }


            AWPDataSetTableAdapters.BookKeywordsTableAdapter dt1 = new AWPDataSetTableAdapters.BookKeywordsTableAdapter();
            dt1.SP_UP_BookKeywords(TextBox5.Text, Convert.ToInt32(DropDownList3.SelectedValue));

            Label1.Visible = true;
        }
        catch { }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            AWPDataSetTableAdapters.BookAuthorsTableAdapter dt = new AWPDataSetTableAdapters.BookAuthorsTableAdapter();
            dt.SP_DE_BooksAuthors(Convert.ToInt32(DropDownList3.SelectedValue));
            AWPDataSetTableAdapters.BookKeywordsTableAdapter dt1 = new AWPDataSetTableAdapters.BookKeywordsTableAdapter();
            dt1.SP_DE_BookKeywords(Convert.ToInt32(DropDownList3.SelectedValue));
            AWPDataSetTableAdapters.BooksTableAdapter dt2 = new AWPDataSetTableAdapters.BooksTableAdapter();
            dt2.SP_DE_Book(Convert.ToInt32(DropDownList3.SelectedValue));
            FileInfo f = new FileInfo(@"C:\Web Site For Books\Images_book\" + DropDownList3.SelectedValue + ".jpg");
            f.Delete();
            Label3.Visible = true;
        }
        catch { }



    }



    protected void LinkButton1_Click(object sender, EventArgs e)
    {
       
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        LinkButton3.Visible = true;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        try
        {
            if (RadioButtonList1.SelectedValue == "Add Author")
            {
                AWPDataSetTableAdapters.AuthorsTableAdapter dt = new AWPDataSetTableAdapters.AuthorsTableAdapter();
                dt.SP_IN_Authors(TextBox8.Text, Convert.ToInt32(DropDownList5.SelectedValue), TextBox9.Text);
                Label4.Visible = true;
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
            case "Add Author": { Button4.Visible = true; Button5.Visible = false; DropDownList4.Visible = false; } break;
            case "Select Author": { Button4.Visible = false; Button5.Visible = true; DropDownList4.Visible = true; } break;

        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        try
        {
            if (RadioButtonList1.SelectedValue == "Select Author")
            {
                
                int x = Convert.ToInt32(DropDownList3.SelectedValue);
                AWPDataSetTableAdapters.BookAuthorsTableAdapter dt2 = new AWPDataSetTableAdapters.BookAuthorsTableAdapter();
                dt2.SP_IN_BookAuthor(x, Convert.ToInt32(DropDownList4.SelectedValue));
                Label4.Visible = true;
            }

        }
        catch
        { }
    }
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        AWPDataSetTableAdapters.AuthorsTableAdapter dt = new AWPDataSetTableAdapters.AuthorsTableAdapter();
        AWPDataSet.AuthorsDataTable da = dt.GetData(Convert.ToInt32(DropDownList4.SelectedValue));

        TextBox8.Text = da.Rows[0]["AuthorName"].ToString();
        DropDownList5.SelectedValue = da.Rows[0]["NationalityID"].ToString();
        TextBox9.Text = da.Rows[0]["AuthorDescription"].ToString();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox8.Text = "";
        TextBox9.Text = "NO";
        DropDownList5.SelectedValue = "1";
        Label4.Visible = false;
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        LinkButton3.Visible = false;
    }
}