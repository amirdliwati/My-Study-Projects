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
   public class GetQuryWeight
    {
       private string connectionString1;
       int CountDoc;
       public GetQuryWeight()
        {
            //connectionString1 = "Data Source=AMIR-PC;Initial Catalog=my_data;Integrated Security=True";
            connectionString1 = WebConfigurationManager.ConnectionStrings["ConSTR"].ConnectionString;
            ClassesPublic CP = new ClassesPublic();
            CountDoc = CP.GetDocCount();
        }

         

         public List<string> getWordLists()
       {
           List<string> Getvector = new List<string>();
           SqlConnection con = new SqlConnection(connectionString1);
           SqlCommand cmd = new SqlCommand("getWordList", con);
           cmd.CommandType = CommandType.StoredProcedure;
           try
           {
               con.Open();
               SqlDataReader reader = cmd.ExecuteReader();
               DataTable DT = new DataTable();
               DT.Load(reader);
               reader.Close();
               foreach (DataRow row in DT.Rows)
               {

                   Getvector.Add(row["Term"].ToString());

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

           SqlCommand cmd2 = new SqlCommand("getWordList2", con);
           cmd2.CommandType = CommandType.StoredProcedure;
           try
           {
               con.Open();
               SqlDataReader reader = cmd2.ExecuteReader();
               DataTable DT = new DataTable();
               DT.Load(reader);
               reader.Close();
               foreach (DataRow row in DT.Rows)
               {

                   Getvector.Add(row["Term"].ToString());

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

         public static List<String> getWordList(List<String> wordlist, string query)
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
               wordlist.Add(Stem);
           }

           return wordlist;
       }

         public List<Double> createVector(List<String> wordlist)
         {
             List<Double> queryvector = new List<double>();

             double tfIDF;
             int i = 0;
                 for (int j = 0; j < getWordLists().Count; j++)
                 {

                     if (!wordlist.Contains(getWordLists()[j]))
                     {
                         tfIDF = 0.0;
                         queryvector.Add(tfIDF);
                     }
                     else
                     {
                         tfIDF = getIDF(wordlist[i]);
                         queryvector.Add(tfIDF);
                         i++;
                     }

                 }
                   
                 
                 return queryvector;
             }    

         private double getIDF(string term)
         {
             double FreqTerm2;
             SqlConnection con = new SqlConnection(connectionString1);
             SqlCommand cmd1 = new SqlCommand("GetTermFreqAllEnglish", con);
             cmd1.CommandType = CommandType.StoredProcedure;
             cmd1.Parameters.Add(new SqlParameter("@term", SqlDbType.NVarChar));
             cmd1.Parameters["@term"].Value = term;
             try
             {
                 con.Open();
                 SqlDataReader reader = cmd1.ExecuteReader();
                 reader.Read();
                 if (reader.HasRows == false)
                 {
                     SqlCommand cmd2 = new SqlCommand("GetTermFreqAllArabic", con);
                     cmd2.CommandType = CommandType.StoredProcedure;
                     cmd2.Parameters.Add(new SqlParameter("@term", SqlDbType.NVarChar));
                     cmd2.Parameters["@term"].Value = term;
                     SqlDataReader reader2 = cmd2.ExecuteReader();
                     reader2.Read();
                     if (reader2.HasRows == false)
                     {

                         FreqTerm2 = 0;
                         reader2.Close();
                         return FreqTerm2;
                     }
                     else
                     {
                         FreqTerm2 = Convert.ToDouble(reader2[0]);
                         FreqTerm2 = Math.Log(CountDoc / FreqTerm2);
                         reader2.Close();
                         return FreqTerm2;
                     }
                     
                 }
                 else
                 {

                     FreqTerm2 = Convert.ToDouble(reader[0]);
                     FreqTerm2 = Math.Log(CountDoc / FreqTerm2);
                     reader.Close();
                     return FreqTerm2;
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
         }

         public List<Double> MCsUGM_SVM(string Query)
         {
                
             List<Double> vec = new List<double>(); 
             List<String> wordlist = new List<String>();
             getWordList(wordlist, Query);
             vec = createVector(wordlist);
             return vec;
    

         }



    }
}
