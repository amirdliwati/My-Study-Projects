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
            int n, i, num, result = 0;// n as countter
            string sn,snum;

            System.Console.WriteLine(" plz type the No u want to enter");

            ///read
            sn = System.Console.ReadLine();
            n = int.Parse(sn);
            i = 1;


            ///processing
            System.Console.WriteLine("enter no");
            snum = System.Console.ReadLine();
            num = int.Parse(snum);

            result = result + num;

            i = i+1; /// coz we read no befroe.
            while (i <= n)
            {

                System.Console.WriteLine("enter no");
                snum = System.Console.ReadLine();
                num = int.Parse(snum);
                result = result + num;
                i = i + 1;

            }
            //// output
            System.Console.WriteLine("result= "+result  );
            System.Console.ReadLine();

        }
    }
}
