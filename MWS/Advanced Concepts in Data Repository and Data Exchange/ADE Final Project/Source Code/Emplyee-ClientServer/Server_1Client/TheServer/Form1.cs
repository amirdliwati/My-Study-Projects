using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net.Sockets;
using System.IO;
using Sedna.Net;

 
namespace TheServer
{
    public partial class Form1 : Form
    {
        SednaSession session = null;
        NetworkStream stream = null;
        StreamReader input = null;
        StreamWriter output = null;
        TcpClient s=null;
        TcpListener listener = null;
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
             listener = new TcpListener(9999);
            listener.Start();
            Console.WriteLine("Waiting 4 connections....");
             s = listener.AcceptTcpClient();
            Console.WriteLine("Accept new Client...");
            this.Visible = false;
             stream = s.GetStream();
             input = new StreamReader(stream);
             output = new StreamWriter(stream);
             start_Server();
         
        }
//********************************************************************
        private void start_Server()
        {
            Boolean st = true;
            string n1 = "";
            while (st)
            {
                n1 = "";
                Console.WriteLine("Wating For NeW Query...");
                n1 = input.ReadLine();
                Console.WriteLine("Receive a Query =  " + n1);

                if (n1 != "query")//if for insert only
                {
                    try
                    {
                        QueryResult res = session.Execute(n1);
                        if (res == null)
                        {
                            Console.WriteLine("Result Executed...");

                            output.WriteLine("ok");
                            output.Flush();
                        }
                        else
                        {
                            output.WriteLine("ok");
                            output.Flush();


                        }

                        session.CommitTransaction();
                    }
                    catch (Exception ex)
                    {
                       
                        MessageBox.Show("حدث خطأ بعملية الإضافة");
                    }
                

                }//end if 
                else {//for query 
                    Console.WriteLine("in Query =Else");
                    try
                    {
                        n1 = input.ReadLine();
                        QueryResult res = session.Execute(n1);
                        if (res == null)
                        {
                            Console.WriteLine("Result null...");

                            output.WriteLine(res.GetCompleteResult());
                            output.Flush();
                        }
                        else
                        {string result_query=res.GetCompleteResult();
                        result_query=result_query.Replace("\r", "");
                       result_query= result_query.Replace("\n", "");
            
                        Console.WriteLine("Result Not null..."+ result_query);
                        output.WriteLine(result_query);
                        output.Flush();


                        }

                        session.CommitTransaction();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("حدث خطأ بعملية الإضافة");
                    }
 
                
                }
            }




            input.Close();
            output.Close();
            s.Close();

            Console.WriteLine("Response sent");
            listener.Stop();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Login l = new Login();
            if (l.ShowDialog(this) == DialogResult.OK)
                session = l.GetSession();
            MessageBox.Show("Sedna Connect...");
            button2.Enabled = false;

        }

        private void Form1_Load(object sender, EventArgs e)
        {
         
        }
       
    }
}
