using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AnalysisServices.AdomdClient;

public partial class Controls_ctlClusters : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<int> output = new List<int>();

        predict(output, 2);

        foreach (int i in output)
            lblResult.Text += " " + i;
    }
    private void predict(List<int> output, int count)
    {
        AdomdConnection con = new AdomdConnection("Data Source=localhost;catalog=FreqBoughtTogether");
        con.Open();
        AdomdCommand cmd = con.CreateCommand();

        string s = @"select Predict([Category ID]) From
[ClassifyCustomer_MM]
natural prediction join
(Select 
{0} as [Age],
{1} as [Children Count],
{2} as [Gender ID],
{3} as [Maritital Status ID],
{4} as [Nationality ID]
) as t";
        s = string.Format(s
            ,(int) DateTime.Today.Subtract(clsGlobal.CurrentCustomer.BirthDate).TotalDays / 365
            , clsGlobal.CurrentCustomer.ChildrenCount
            , clsGlobal.CurrentCustomer.GenderID
            , clsGlobal.CurrentCustomer.MarititalStatusID
            , clsGlobal.CurrentCustomer.NationalityID);
        cmd.CommandText = s;
        AdomdDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            if (dr[0] != null)
                output.Add(dr.GetInt32(0));
        }
        dr.Close();
        con.Close();
    }
}