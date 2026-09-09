using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AIRLibrary;

namespace AIRWeb
{
    public partial class Indexing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool s;
            Index indexing = new Index();
            VectorEnglish vector = new VectorEnglish();
            VectorArabic vectorA = new VectorArabic();
            VectorModel ve = new VectorModel();
            ClassesPublic cp = new ClassesPublic();
            List<String> wordlist = new List<String>();
            cp.DeleteDoc();
            cp.AddDocuments();
            if (RadioButtonList1.SelectedValue == "English")
            {
                indexing.DeleteIndexesEnglish();

                Label2.Text = " ";
                s = indexing.EnglishIndexes();

                if (s == true)
                    Label2.Text = "successfully";
                else
                    Label2.Text = "Faild";
            }
            else
            {
                indexing.DeleteIndexesArabic();
                Label2.Text = " ";
                s = indexing.ArabicIndexes();
                if (s == true)
                    Label2.Text = "successfully";
                else
                    Label2.Text = "Faild";
            }
            Label2.Text = "Create Vectors";
            vector.DeleteVectorEnglish();
            vector.AddVector();
            vectorA.AddVector();
            ve.DeleteVector();
            wordlist.AddRange(ve.getWordList());
            ve.createVector(wordlist);
            Label2.Text = "successfully";
   
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Label2.Text = "successfully";
        }
    }
}