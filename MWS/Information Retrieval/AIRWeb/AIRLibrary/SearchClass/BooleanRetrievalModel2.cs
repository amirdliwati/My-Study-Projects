using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using System.ComponentModel;

namespace AIRLibrary
{
   public class BooleanRetrievalModel2
    {
 

    private string connectionString1;
    public BooleanRetrievalModel2()
        {
            //connectionString1 = "Data Source=AMIR-PC;Initial Catalog=my_data;Integrated Security=True";
            connectionString1 = WebConfigurationManager.ConnectionStrings["ConSTR"].ConnectionString;
            
        }
    public string[] booleanOperator = new string[] { "and", "or", "not" };
    //public List<int> resultSet = new List<int>();


    private void FilterQueryTerm(ref string[] str)
    {
        List<string> _queryTerm = new List<string>();


        foreach (string queryTerm in str)
        {
            if (queryTerm.ToUpper().Equals("BUT") || booleanOperator.Contains(queryTerm))
            {
                _queryTerm.Add(queryTerm);

            }
        }

        str = _queryTerm.ToArray();
    }

    public List<int> getfilename(string gureyString)
    {
        int count = 0;
        List<int> res = new List<int>();
        string query = gureyString;
        List<int> lst = ProcessQuery(query);
            
            count = 1;
            if (lst != null)
            {
                foreach (int a in lst)
                {
                    if (a == 1)
                    {
                        res.Add(Convert.ToInt32(count));
                        
                    }
                    count++;
                }
            }
        return res;
        
    }

    public  List<int> ProcessQuery(string query)
    {
        CheckWord check = new CheckWord();
        ArrayList termsArr = new ArrayList();
        RemoveStopWords RSW = new RemoveStopWords();

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

        //query boolean operator
        string bitWiseOp = string.Empty;
        string[] queryTerm = StemmerArr.ToArray();
        //remove query term that doesnot appears on document collection
        //FilterQueryTerm(ref queryTerm);
        List<int> previousTermIncidenceV = null;
        List<int> nextTermsIncidenceV = null;
        //holds the bitwise operation result
        List<int> resultSet = null;
        //suppose on query X AND Y, X is previousTerm term and Y is nextTerm
        Boolean hasPreviousTerm = false;
        Boolean hasNotOperation = false;
        foreach (string term in queryTerm)
        {
            //is a term
            if (!booleanOperator.Contains(term) && !term.Equals("BUT"))
            {
                //query case: structure AND NOT analysis
                if (hasNotOperation)
                {

                    if (hasPreviousTerm)
                    {
                        nextTermsIncidenceV = ProcessBooleanOperator("not", GetTermIncidenceVector(term), nextTermsIncidenceV);
                    }
                    //query case: eg.NOT analysis
                    else
                    {
                        previousTermIncidenceV = ProcessBooleanOperator("not", GetTermIncidenceVector(term), nextTermsIncidenceV);
                        resultSet = previousTermIncidenceV;
                    }
                    hasNotOperation = false;
                }
                else if (!hasPreviousTerm)
                {
                    previousTermIncidenceV = GetTermIncidenceVector(term);
                    resultSet = previousTermIncidenceV;
                    hasPreviousTerm = true; //
                }
                else
                {

                    nextTermsIncidenceV = GetTermIncidenceVector(term);
                }
            }
            else if (term.Equals("not"))
            {
                //indicates that the  term in the next iteration should be complemented.
                hasNotOperation = true;
            }
            else
            {
                //'BUT' also should be evaluated as AND eg. structure BUT NOT semantic should be evaluated as structure AND NOT semantic
                if (term.Equals("BUT"))
                {
                    bitWiseOp = "and";
                }
                else
                    bitWiseOp = term;
            }

            if (nextTermsIncidenceV != null && !hasNotOperation)
            {
                resultSet = ProcessBooleanOperator(bitWiseOp, previousTermIncidenceV, nextTermsIncidenceV);
                previousTermIncidenceV = resultSet;
                hasPreviousTerm = true;
                nextTermsIncidenceV = null;
            }
        }

        return resultSet;
    }

    public  List<int> ProcessBooleanOperator(string op, List<int> previousTermV, List<int> nextTermV)
    {
        List<int> resultSet = new List<int>();
        if (op.Equals("not"))
        {
            foreach (int a in previousTermV)
            {
                if (a == 1)
                {
                    resultSet.Add(0);
                }
                else
                {
                    resultSet.Add(1);
                }
            }
        }
        else if (op.ToUpper().Equals("AND")) //bitwise AND operation
        {
            for (int a = 0; a < previousTermV.Count; a++)
            {
                if (previousTermV[a] == 1 && nextTermV[a] == 1)
                {
                    resultSet.Add(1);
                }
                else
                {
                    resultSet.Add(0);
                }
            }
        }
        else if (op.ToUpper().Equals("OR")) //bitwise OR operation
        {
            for (int a = 0; a < previousTermV.Count; a++)
            {
                if (previousTermV[a] == 0 && nextTermV[a] == 0)
                {
                    resultSet.Add(0);
                }
                else
                {
                    resultSet.Add(1);
                }
            }
        }
        return resultSet;
    }

    public List<int> GetTermIncidenceVector(string term)
    {
        List<int> Getvector = new List<int>();
        SqlConnection con = new SqlConnection(connectionString1);
        SqlCommand cmd = new SqlCommand("GetVectorEnglishForTerm", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@term", SqlDbType.NVarChar));
        cmd.Parameters["@term"].Value = term;
        try
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            DataTable DT = new DataTable();
            DT.Load(reader);
            reader.Close();
            foreach (DataRow row in DT.Rows)
            {

                Getvector.Add(Convert.ToInt32(row["Vector"]));

            }

        }
        catch (SqlException err)
        {
            throw new ApplicationException("Data error." + err);
        }
        finally
        {
            con.Close();
        }


        return Getvector;

    }


      


    }
}
