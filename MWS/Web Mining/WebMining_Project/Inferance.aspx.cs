using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using VDS.RDF;
using VDS.RDF.Query;

public partial class Validation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Inference all = new Inference();
        GridView2.DataSource = all.PersonInfer();
        GridView3.DataSource = all.MammalInfer();
        DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label Object = (Label)e.Row.Cells[0].FindControl("Label1");
            Label Predicate = (Label)e.Row.Cells[0].FindControl("Label2");
            Label Subject = (Label)e.Row.Cells[0].FindControl("Label3");
            char[] splitchar = { '#' };
            string[] strArr = Object.Text.Split(splitchar);
            Object.Text = strArr[1];

            strArr = Predicate.Text.Split(splitchar);
            Predicate.Text = strArr[1];

            strArr = Subject.Text.Split(splitchar);
            Subject.Text = strArr[1];
        }
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label Object = (Label)e.Row.Cells[0].FindControl("Label4");
            
            char[] splitchar = { '#' };
            string[] strArr = Object.Text.Split(splitchar);
            Object.Text = strArr[1];        
        }
    }
    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label Object = (Label)e.Row.Cells[0].FindControl("Label5");

            char[] splitchar = { '#' };
            string[] strArr = Object.Text.Split(splitchar);
            Object.Text = strArr[1];
        }
    }
}