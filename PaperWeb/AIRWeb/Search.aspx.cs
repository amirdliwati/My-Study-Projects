using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using AIRLibrary;
using System.Data;

namespace AIRWeb
{
    public partial class _1_Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Literal1.Text = " ";
                Dictionary<int, double> re = new Dictionary<int, double>();
                if (RadioButtonList1.SelectedValue == "Boolean Model")
                {
                    BooleanRetrievalModel2 Bo = new BooleanRetrievalModel2();
                    List<int> aa = new List<int>();
                    aa.AddRange(Bo.getfilename(TextBox1.Text));
                    for (int i = 0; i < aa.Count; i++)
                    {
                        re.Add(aa[i], 5);
                    }
                    GridView1.DataSource = re;
                    GridView1.DataBind();
                    Label5.Text = "";
                }
                else if (RadioButtonList1.SelectedValue == "Extended Boolean")
                {
                    ExtendedBooleanRetrievalModel ex = new ExtendedBooleanRetrievalModel();
                    re = ex.processQuery(TextBox1.Text);
                    List<double> value = new List<double>();
                    List<int> Keys = new List<int>();
                    value.AddRange(re.Values);
                    Keys.AddRange(re.Keys);
                    for (int i = 0; i < value.Count; i++)
                    {
                        if (value[i] <= 0.2)
                        {
                            value[i] = 1;
                        }
                        else if (value[i] <= 0.4)
                        {
                            value[i] = 2;
                        }
                        else if (value[i] <= 0.6)
                        {
                            value[i] = 3;
                        }
                        else if (value[i] <= 0.8)
                        {
                            value[i] = 4;
                        }
                        else
                        {
                            value[i] = 5;
                        }
                    }
                    Dictionary<int, double> re2 = new Dictionary<int, double>();
                    for (int i = 0; i < re.Count; i++)
                    {
                        re2.Add(Keys[i], value[i]);
                    }
                    GridView1.DataSource = re2;
                    GridView1.DataBind();
                    Label5.Text = "";
                }
                else
                {
                    VectorModel ve = new VectorModel();
                    re = ve.MCsUGM_SVM(TextBox1.Text);
                    List<double> value = new List<double>();
                    List<int> Keys = new List<int>();
                    value.AddRange(re.Values);
                    Keys.AddRange(re.Keys);
                    for (int i = 0; i < value.Count; i++)
                    {
                        if (value[i] <= 0.2)
                        {
                            value[i] = 1;
                        }
                        else if (value[i] <= 0.4)
                        {
                            value[i] = 2;
                        }
                        else if (value[i] <= 0.6)
                        {
                            value[i] = 3;
                        }
                        else if (value[i] <= 0.8)
                        {
                            value[i] = 4;
                        }
                        else
                        {
                            value[i] = 5;
                        }
                    }
                    Dictionary<int, double> re2 = new Dictionary<int, double>();
                    for (int i = 0; i < re.Count; i++)
                    {
                        re2.Add(Keys[i], value[i]);
                    }
                    GridView1.DataSource = re2;
                    GridView1.DataBind();
                    Label5.Text = "";
                }
            }
            catch { Label5.Text = "No Result"; } 
           
        }

        private string HighlighText(string Source, string SearchText)
        {
            return Regex.Replace(Source, SearchText, new MatchEvaluator(ReplaceKeyWords), RegexOptions.IgnoreCase);
        }
        public string ReplaceKeyWords(Match m)
        {
            string tagstring = "";
            return tagstring = "<span style='color:Red'>" + m.Value + "</span>";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = GridView1.SelectedIndex;
            int ID = (int)GridView1.SelectedDataKey.Values["Key"];
            ClassesPublic CP = new ClassesPublic();
            Literal1.Text = CP.GetDocValue(ID.ToString()+".doc");
            string[] R = TextBox1.Text.ToLower().Split(' ');
            for (int i = 0; i < R.Length; i++)
            {
                Literal1.Text = HighlighText(Literal1.Text, R[i]);
            }
        }
    }
}