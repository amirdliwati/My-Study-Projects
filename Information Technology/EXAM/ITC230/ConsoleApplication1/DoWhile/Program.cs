using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            /// variable decleration
            int n,num, result = 0;// n as countter
            
            System.Console.WriteLine(" plz type the No u want to enter");

            ///read
            n = int.Parse(System.Console.ReadLine());


            ///processing
            //System.Console.WriteLine("enter no");
            //snum = System.Console.ReadLine();
            //num = int.Parse(snum);

            //result = result + num;

           /// coz we read no befroe.

            for (int i =1; i <= n; i=i++)
            {

                System.Console.WriteLine("enter no");
                num = int.Parse( System.Console.ReadLine());
                result = result + num;

            }
            

            //// output
            System.Console.WriteLine("result= " + result);
            System.Console.ReadLine();

        }
    }
}
