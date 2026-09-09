using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MyLibrary;
using System.Data.SqlClient;
using System.Data;



namespace MyServer
{
    class Company : MarshalByRefObject, IMyCompany
    {
         
        public DataTable getdata()
        {
            SqlConnection mycon = new SqlConnection(ConectionDB.x);
            mycon.Open();
            SqlCommand com = new SqlCommand("select * from Job", mycon);
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            mycon.Close();
            Console.WriteLine("The Qury Is Successfully");
            return dt;
        }

        DataTable IMyCompany.GetJobsForCompany(int id)
        {
            SqlConnection mycon = new SqlConnection(ConectionDB.x);
            mycon.Open();
            SqlCommand com = new SqlCommand("select * from Job where companyId=@companyId", mycon);
            SqlParameter p = new SqlParameter("@companyId", Convert.ToInt32(id));
            com.CommandType = CommandType.Text;
            com.Parameters.Add(p);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            mycon.Close();
            Console.WriteLine("The Qury Is Successfully");
            return dt;          
        }

        DataTable IMyCompany.GetDiplomForCandidate(int id)
        {
            SqlConnection mycon = new SqlConnection(ConectionDB.x);
            mycon.Open();
            SqlCommand com = new SqlCommand("select * from Diploma where candidateId=@candidateId", mycon);
            SqlParameter p = new SqlParameter("@candidateId", Convert.ToInt32(id));
            com.CommandType = CommandType.Text;
            com.Parameters.Add(p);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            mycon.Close();
            Console.WriteLine("The Qury Is Successfully");
            return dt;
        }
    }
}

