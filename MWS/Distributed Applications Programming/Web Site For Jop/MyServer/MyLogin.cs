using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MyLibrary;
using System.Data.SqlClient;
using System.Data;

namespace MyServer
{
    class MyLogin :MarshalByRefObject, ISignin
    {

        public bool GetLoginPassword(Signin e)
        {
            
            SqlConnection mycon = new SqlConnection(ConectionDB.x);
            mycon.Open();
            SqlCommand com = new SqlCommand("select * from Candidate where ((login=@login)and (password=@password)) ", mycon);
            SqlParameter p = new SqlParameter("@login", e.LoginName.ToString());
            SqlParameter p1 = new SqlParameter("@password", e.LoginPassword.ToString());
            com.CommandType = CommandType.Text;
            com.Parameters.Add(p);
            com.Parameters.Add(p1);
            SqlDataReader myreder = com.ExecuteReader();
            if (myreder.HasRows == true)
            {
                myreder.Close();
                mycon.Close();
                Console.WriteLine("The Qury Is Successfully");
                return true;
               
            }

            else
            {
                mycon.Close();
                SqlConnection mycon1 = new SqlConnection(ConectionDB.x);
                mycon1.Open();
                SqlCommand com1 = new SqlCommand("select * from Company where ((login=@login)and (password=@password)) ", mycon1);
                SqlParameter p2 = new SqlParameter("@login", e.LoginName.ToString());
                SqlParameter p3 = new SqlParameter("@password", e.LoginPassword.ToString());
                com1.CommandType = CommandType.Text;
                com1.Parameters.Add(p2);
                com1.Parameters.Add(p3);
                SqlDataReader myreder1 = com1.ExecuteReader();
                if (myreder1.HasRows == true)
                {
                    mycon1.Close();
                    Console.WriteLine("The Qury Is Successfully");
                    return true;


                }
                else
                {
                    mycon1.Close();
                    Console.WriteLine("The Qury Is UnSuccessfully");
                    return false;
                
                }
                

            }

        }
    }

    
}

