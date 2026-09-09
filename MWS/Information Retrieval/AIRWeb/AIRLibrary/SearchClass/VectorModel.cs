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
    public class VectorModel
    {
         private string connectionString1;
         int CountDoc;
         public VectorModel()
        {
            //connectionString1 = "Data Source=AMIR-PC;Initial Catalog=my_data;Integrated Security=True";
            connectionString1 = WebConfigurationManager.ConnectionStrings["ConSTR"].ConnectionString;
            ClassesPublic CP = new ClassesPublic();
            CountDoc = CP.GetDocCount();
        }

         public List<string> getWordList()
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

         public void createVector(List<String> wordlist)
         {
             double[] queryvector;

             SqlConnection con = new SqlConnection(connectionString1);
             SqlCommand cmd = new SqlCommand("AddWeight", con);
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Parameters.Add(new SqlParameter("@IdDoc", SqlDbType.Int));
             cmd.Parameters.Add(new SqlParameter("@Weight", SqlDbType.Float));
             con.Open();
             try
             {
                 for (int j = 1; j <= CountDoc; j++)
                 {
                     queryvector = new double[wordlist.Count];

                     for (int i = 0; i < wordlist.Count; i++)
                     {

                         double tfIDF = getTF(j, wordlist[i]) * getIDF(wordlist[i]);
                         queryvector[i] = tfIDF;
                         cmd.Parameters["@IdDoc"].Value = j;
                         cmd.Parameters["@Weight"].Value = tfIDF;
                         cmd.ExecuteNonQuery();
                     }

                  
                 }
             }
             catch (SqlException err)
             {
                 throw new ApplicationException("Data error." + err);
             }

             con.Close();
         }

         public void classify(Dictionary<int, Double> sortedList, string Query)
         {
             GetQuryWeight vec = new GetQuryWeight();
             double temp = 0.0;
             double[] queryvector;
             double[] docvector;

             queryvector = vec.MCsUGM_SVM(Query).ToArray();

             for (int i = 1; i <= CountDoc; i++)
             {
                             
                     temp = cosinetheta(queryvector, getWeight(i).ToArray());
                     sortedList.Add(i, temp);   
                 
             }
         }

         public List<Double> getWeight(int id)
         {
             List<Double> a = new List<double>();
             SqlConnection con = new SqlConnection(connectionString1);
             SqlCommand cmd = new SqlCommand("GetVectorWeight", con);
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.NVarChar));
             cmd.Parameters["@id"].Value = id;
             try
             {
                 con.Open();
                 SqlDataReader reader = cmd.ExecuteReader();
                 DataTable DT = new DataTable();
                 DT.Load(reader);
                 reader.Close();
                 foreach (DataRow row in DT.Rows)
                 {

                     a.Add(Convert.ToDouble(row["Weight"]));

                 }
                 

                 reader.Close();


             }
             catch (SqlException err)
             {
                 throw new ApplicationException("Data error." + err);
             }
             finally
             {
                 con.Close();
             }

             return a;

         }

         public static double dotproduct(double[] v1, double[] v2)
         {
             double product = 0.0;
             if (v1.Length == v2.Length)
             {
                 for (int i = 0; i < v1.Length; i++)
                 {
                     product += v1[i] * v2[i];
                 }
             }
            
             return product;
         }

         public static double vectorlength(double[] vector)
         {
             double length = 0.0;
             for (int i = 0; i < vector.Length; i++)
             {
                 length += Math.Pow(vector[i], 2);
             }

             return Math.Sqrt(length);
         }

         private  double getTF(int IDdoc, string term)
         {
             double FreqTerm;
             SqlConnection con = new SqlConnection(connectionString1);
             SqlCommand cmd = new SqlCommand("GetFreqTermEnglish", con);
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Parameters.Add(new SqlParameter("@Term", SqlDbType.NVarChar));
             cmd.Parameters["@Term"].Value = term;
             cmd.Parameters.Add(new SqlParameter("@IDdoc", SqlDbType.Int));
             cmd.Parameters["@IDdoc"].Value = IDdoc;
             try
             {
                 con.Open();
                 SqlDataReader reader = cmd.ExecuteReader();
                 reader.Read();
                 if (reader.HasRows == false)
                 {
                     reader.Close();
                     SqlCommand cmd2 = new SqlCommand("GetFreqTermArabic", con);
                     cmd2.CommandType = CommandType.StoredProcedure;
                     cmd2.Parameters.Add(new SqlParameter("@Term", SqlDbType.NVarChar));
                     cmd2.Parameters["@Term"].Value = term;
                     cmd2.Parameters.Add(new SqlParameter("@IDdoc", SqlDbType.Int));
                     cmd2.Parameters["@IDdoc"].Value = IDdoc;
                     SqlDataReader reader2 = cmd2.ExecuteReader();
                     reader2.Read();
                     if (reader2.HasRows == false)
                     {
                         FreqTerm = 0;
                         reader2.Close();
                         return FreqTerm;
                     }
                     else
                     {
                         FreqTerm = Convert.ToDouble(reader2[0]);
                         reader2.Close();
                         return FreqTerm;
                     }
                 }
                 else
                 {
                 FreqTerm = Convert.ToDouble(reader[0]);
                 reader.Close();
                 return FreqTerm;
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
                     reader.Close();
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

         public static double cosinetheta(double[] v1, double[] v2)
         {
             double lengthV1 = vectorlength(v1);
             double lengthV2 = vectorlength(v2);

             double dotprod = dotproduct(v1, v2);

             return dotprod / (lengthV1 * lengthV2);

         }

         public Dictionary<int, Double> MCsUGM_SVM(string Query)
         {

             Dictionary<int, Double> sortedList = new Dictionary<int, Double>();            
             classify(sortedList,Query);
             return sortedList;
    

         }

         public bool DeleteVector()
         {
             bool status = false;
             SqlConnection con = new SqlConnection(connectionString1);
             SqlCommand cmd = new SqlCommand("deleteVectorWeight", con);
             cmd.CommandType = CommandType.StoredProcedure;

             try
             {
                 con.Open();
                 cmd.ExecuteNonQuery();
             }
             catch (SqlException err)
             {

                 throw new ApplicationException("Data error." + err);
             }
             finally
             {
                 con.Close();
                 status = true;
             }
             return status;

         }


    }
}
