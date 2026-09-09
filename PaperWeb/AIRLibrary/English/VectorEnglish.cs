using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

namespace AIRLibrary
{
   public class VectorEnglish
    {

         private string connectionString1;
         int CountDoc;
         public VectorEnglish()
        {
            //connectionString1 = "Data Source=AMIR-PC;Initial Catalog=my_data;Integrated Security=True";
            connectionString1 = WebConfigurationManager.ConnectionStrings["ConSTR"].ConnectionString;
            ClassesPublic CP = new ClassesPublic();
             CountDoc = CP.GetDocCount();
            
        }

       
         //stores distinct terms
        public static HashSet<string> distinctTerm = new HashSet<string>();
        //stores document id and its contents without splitting
        public static Dictionary<int, string> documentContentList = new Dictionary<int, string>();
        //stores document and its terms collection
        public static Dictionary<string, List<string>> documentCollection = new Dictionary<string, List<string>>();
        public static Dictionary<string, List<int>> termDocumentIncidenceMatrix = new Dictionary<string, List<int>>();




         public void AddVector()
        {
            int count = 0;
             
             for (int i = 1; i <= CountDoc; i++)
            {
                string name = Convert.ToString(i);
                string contents = GetPosting(i).ToString();

                String[] termsCollection = GetPosting(i).ToArray();
                foreach (string term in termsCollection)
                {

                    distinctTerm.Add(term);

                }


                documentCollection.Add(name, termsCollection.ToList());
                count++;
            }
            termDocumentIncidenceMatrix = GetTermDocumentIncidenceMatrix(distinctTerm, documentCollection);
            //AddTermsFreqEnglish();

        }
            
         public List<string> GetPosting(int id)
        {
            List<string> GetPosings = new List<string>();
            SqlConnection con = new SqlConnection(connectionString1);
            SqlCommand cmd = new SqlCommand("GetPostingEnglish", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@docId", SqlDbType.Int));
            cmd.Parameters["@docId"].Value = id;
        try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable DT = new DataTable();
                DT.Load(reader);
                reader.Close();
                foreach (DataRow row in DT.Rows)
                {
                    
                    GetPosings.Add(row["Term"].ToString());
                   
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
        
        
        return GetPosings;
        }
      
         public  Dictionary<string, List<int>> GetTermDocumentIncidenceMatrix(HashSet<string> distinctTerms, Dictionary<string, List<string>> documentCollection)
         {
             SqlConnection con = new SqlConnection(connectionString1);
             SqlCommand cmd = new SqlCommand("AddVectorEnglish", con);
             cmd.CommandType = CommandType.StoredProcedure;
             cmd.Parameters.Add(new SqlParameter("@Terms", SqlDbType.NVarChar));
             cmd.Parameters.Add(new SqlParameter("@Vector", SqlDbType.Int, 4));
             con.Open();
             Dictionary<string, List<int>> termDocumentIncidenceMatrix = new Dictionary<string, List<int>>();
             List<int> incidenceVector = new List<int>();
             foreach (string term in distinctTerms)
             {
                 //incidence vector for each terms
                 incidenceVector = new List<int>();
                 foreach (KeyValuePair<string, List<string>> p in documentCollection)
                 {

                     if (p.Value.Contains(term))
                     {
                         //document contains the term
                         incidenceVector.Add(1);

                     }
                     else
                     {
                         //document do not contains the term
                         incidenceVector.Add(0);
                     }
                 }
                 try
                 {
                     termDocumentIncidenceMatrix.Add(term, incidenceVector);

                     for (int x = 0; x < incidenceVector.Count; x++)
                     {
                         cmd.Parameters["@Terms"].Value = term.ToString();
                         cmd.Parameters["@Vector"].Value = Convert.ToInt32(incidenceVector[x]);
                         cmd.ExecuteNonQuery();
                     }
                 }
                 catch (SqlException err)
                 {
                     throw new ApplicationException("Data error." + err);
                 }
                
             }
             con.Close();
             return termDocumentIncidenceMatrix;
             
         }

         public bool DeleteVectorEnglish()
         {
             bool status = false;
             SqlConnection con = new SqlConnection(connectionString1);
             SqlCommand cmd = new SqlCommand("DeleteVectorEnglish", con);
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
