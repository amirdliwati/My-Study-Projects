using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AnalysisServices.AdomdClient;

public partial class Controls_ctlBoughtTogether : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<int> input = new List<int>();
        List<int> output = new List<int>();

        input.Add(int.Parse(Request.QueryString["bid"]));
        predict(input, output, 2);

        string s = "0";
        foreach (int i in output)
            s += ", " + i;

        SqlDataSource ds = new SqlDataSource();
        ds.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["AWPConnectionString"].ConnectionString;
        ds.SelectCommand = "Select * From Books_V Where BookID in (" + s + ")";
        DataList1.DataSource = ds.Select(new DataSourceSelectArguments());
        DataList1.DataBind();
    }
    private void predict(List<int> input, List<int> output, int count)
    {
        AdomdConnection con = new AdomdConnection("Data Source=localhost;catalog=FreqBoughtTogether");
        con.Open();
        AdomdCommand cmd = con.CreateCommand();

        string s = @"
select flattened predict([order detail]," + count.ToString() + @")
from [BoughtTogether_MM]
natural prediction join
(select
	(";
        foreach (int n in input)
        {
            if (input.IndexOf(n) > 0)
                s += " Union ";
            s += string.Format("Select {0} as [Book ID]", n);
        }
        s += @") as [order detail] ) as T";

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