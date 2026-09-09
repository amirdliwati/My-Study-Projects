using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using System.IO;

namespace TheClient
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                string hostname = "localhost";
                TcpClient c = new TcpClient(hostname, 9999);
                Console.WriteLine("Connection established... sending the two numbers:");

                NetworkStream stream = c.GetStream();
                StreamReader input = new StreamReader(stream);
                StreamWriter output = new StreamWriter(stream);
                string n1, n2;
                Boolean st = true;
                while (st)
                {
                    n1 = Console.ReadLine();
                  
                
                    if (n1 == "exit")
                    {
                        st = false;


                    }
                    output.WriteLine(n1 + "!!!!!!!!!!");
                    output.Flush();

                    string result = input.ReadLine();
                    Console.WriteLine("Received result is: " + result);
                }

               
                

                input.Close();
                output.Close();
                c.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error happend: " + ex.Message);
                Console.ReadLine();
            }

            Console.ReadLine();
        }
    }
}
