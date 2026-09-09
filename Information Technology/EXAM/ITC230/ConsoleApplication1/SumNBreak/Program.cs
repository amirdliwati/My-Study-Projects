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
            int n, num, result = 0;// n as countter
            string sn, snum;

            System.Console.WriteLine(" plz type the Count of ur numbers u want to enter");

            ///read
            sn = System.Console.ReadLine();
            n = int.Parse(sn);
            


            ///processing
            for (int i = 1; i <= n; i++)
            {
                System.Console.WriteLine("enter no");
                snum = System.Console.ReadLine();
                num = int.Parse(snum);

                if (num < 0)
                    break;
                result = result + num;


            
            }
            //// output
            System.Console.WriteLine("result= " + result);
            System.Console.ReadLine();

        }
    }
}
