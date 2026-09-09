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
            int n ;
            decimal fact = 1;

            System.Console.WriteLine(" plz type the No u want to enter");

            ///read
            n = int.Parse( System.Console.ReadLine());
            


            ///processing
            for (int i = 1; i <= n; i++)
            {
                fact = fact * i;
            }


            
            //// output
            System.Console.WriteLine("fact= " + fact );
            System.Console.ReadLine();

        }
    }
}
