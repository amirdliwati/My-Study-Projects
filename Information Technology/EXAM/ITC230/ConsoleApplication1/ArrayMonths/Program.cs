using System;
using System.Collections.Generic;
using System.Text;

namespace ArrayMonths
{
    class Program
    {
        static void Main(string[] args)
        {
            int m; string sm;
            string [] months= { "Jan", "Feb","Mar","Apr","May","Jun",
                                "Jul","Aug","Sep","Oct","Nov","Dec"};

            System.Console.WriteLine(" the Length of array is: ");
            System.Console.WriteLine(months.Length);


            System.Console.WriteLine(" Type No of month to get the Month ");

            //read m
            sm = System.Console.ReadLine();
            m = int.Parse(sm);

            //give month string 
            System.Console.WriteLine("Months: " + m + " :is " + months[m - 1]);// observe here the same index m
            System.Console.ReadLine();



                                                   
        }
    }
}
