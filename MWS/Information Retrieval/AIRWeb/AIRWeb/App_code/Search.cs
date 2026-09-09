using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AIRLibrary;
using System.ComponentModel;

namespace AIRWeb
{
    [DataObject]
    public class Search
    {
        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public Dictionary<int, double> SearchFun(string searchType, string searchtxt)
        {
            List<int> aa = new List<int>(); Dictionary<int, double> re = new Dictionary<int, double>();

            if (searchType == "Boolean Model")
            {
                BooleanRetrievalModel2 Bo = new BooleanRetrievalModel2();
               
                aa.AddRange(Bo.getfilename(searchtxt));


            } return re;
            //else if (searchType == "Extended Boolean")
            //{
            //    ExtendedBooleanRetrievalModel ex = new ExtendedBooleanRetrievalModel();
            //    Dictionary<int, int> res = new Dictionary<int, int>();
            //    return ex.processQuery(searchtxt);

            //}
            //else
            //{
            //    VectorModel ve = new VectorModel();
            //    return ve.MCsUGM_SVM(searchtxt);
            //}

            //ClassesPublic CP = new ClassesPublic();
            //Literal1.Text = CP.GetDocValue("1.doc");
            //string[] R = TextBox1.Text.ToLower().Split(' ');
            //for (int i = 0; i < R.Length; i++)
            //{
            //    Literal1.Text = HighlighText(Literal1.Text, R[i]);
            //}

        }
    }
}
