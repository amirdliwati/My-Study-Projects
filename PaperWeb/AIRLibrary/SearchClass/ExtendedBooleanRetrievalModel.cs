using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using System.Text.RegularExpressions;

namespace AIRLibrary
{
    public class ExtendedBooleanRetrievalModel
    {
        private string connectionString1;
        int CountDoc;
        public ExtendedBooleanRetrievalModel()
        {
            //connectionString1 = "Data Source=AMIR-PC;Initial Catalog=my_data;Integrated Security=True";
            connectionString1 = WebConfigurationManager.ConnectionStrings["ConSTR"].ConnectionString;
            ClassesPublic CP = new ClassesPublic();
            CountDoc = CP.GetDocCount();
        }


        public List<string> Getwordlist(string query)
        {
            CheckWord check = new CheckWord();
            ArrayList termsArr = new ArrayList();
            RemoveStopWords2 RSW = new RemoveStopWords2();

            string S = ""; string Temp = "";
            Temp = query;
            for (int l = 0; l < Temp.Length; l++)
                if (char.IsLetter(Temp, l))
                    S += Temp[l].ToString();
                else
                    S += " ";
            S = S.Trim();
            string[] R = S.ToLower().Split(' ');
            for (int j = 0; j < R.Length; j++)
            {
                string Stem = RSW.removing(R[j]);
                if (Stem != "")
                {
                    termsArr.Add(Stem);
                }
            }
            ArrayList StemmerArr1 = new ArrayList();
            //List StemmerArr = new List();
            PorterStemmer Portet = new PorterStemmer();
            for (int k = 0; k < termsArr.Count; k++)
            {
                string Stem = Portet.StemWord(termsArr[k].ToString());
                StemmerArr1.Add(Stem);
            }
            List<string> StemmerArr = new List<string>();
            ISRI StemmerISRI = new ISRI();
            for (int k = 0; k < StemmerArr1.Count; k++)
            {
                string Stem = StemmerISRI.Stemming(StemmerArr1[k].ToString());
                StemmerArr.Add(Stem);
            }
            return StemmerArr;
        }

        public int getwordindoc(string word , int docID)
        {
            int result = 0;

            SqlConnection con = new SqlConnection(connectionString1);
            SqlCommand cmd = new SqlCommand("getdocresultenglish", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@term", SqlDbType.NVarChar,20));
            cmd.Parameters["@term"].Value = word;
            cmd.Parameters.Add(new SqlParameter("@docId", SqlDbType.Int));
            cmd.Parameters["@docID"].Value = docID;
            
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();

                if (reader.HasRows == false)
                {
                    reader.Close();
                    SqlCommand cmd1 = new SqlCommand("getdocresultarabic", con);
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.Add(new SqlParameter("@term", SqlDbType.NVarChar, 20));
                    cmd1.Parameters["@term"].Value = word;
                    cmd1.Parameters.Add(new SqlParameter("@docId", SqlDbType.Int));
                    cmd1.Parameters["@docID"].Value = docID;
                    SqlDataReader reader1 = cmd1.ExecuteReader();
                    reader1.Read();
                    if(reader1.HasRows == false)
                        result = 0;
                    else
                        result = 1;

                }
                else
                    result = 1;
                  
            }
            catch (SqlException err)
            {
                throw new ApplicationException("Data error." + err);
            }

            con.Close();

            return result;
        }

        public Dictionary<int ,Double> processQuery(string Query)
        {
            int check;
            int a;
            double b;
            double sime;
            Dictionary<int, Double> result = new Dictionary<int, Double>();
            List<int> sum = new List<int>();
            List<String> Terms = new List<String>();
            Terms = Getwordlist(Query);
            for (int i = 1; i <= CountDoc; i++)
            {
                for (int j = 0; j < Terms.Count; j++)
                {
                    check = getwordindoc(Terms[j], i);
                        a = 1 - check;
                        a = a * a;
                        sum.Add(a);
                }
                b = sum.Sum();
                sum.Clear();
                b = b / Terms.Count;
                sime = 1 - Math.Sqrt(b);
                result.Add(i,sime);                  
            }

            return result;
        }

    }
}
