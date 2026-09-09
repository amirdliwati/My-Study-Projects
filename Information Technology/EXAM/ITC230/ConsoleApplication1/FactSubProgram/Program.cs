using System;
using System.Collections.Generic;
using System.Text;

namespace FactSubProgram
{
    class Program
    {
        static void Main(string[] args)
        {
            int n, m, y, x;
            System.Console.WriteLine(" input n,m");

            //read n,m
            n = int.Parse(System.Console.ReadLine());
            m = int.Parse(System.Console.ReadLine());

            //x = fact(n);
            //y = fact(m);

            //System.Console.WriteLine("x= " + x + "y= " + y);
            x = (fact(m) * fact(n - m));

            if (x == 0)
                System.Console.WriteLine(" Can NOT divide by Zero");
            else
            {
                y = fact(n) / x;
                System.Console.WriteLine("n!/m!*(n - m)!= " + y);
            }

            System.Console.ReadLine();
        }

        static int fact(int n)
        {
            int f = 1;

            for (int i = 1; i <=n; i=i+1)// i must Be star from 1 NOT zero coz this is Multiplication
            {
                f = f * i;
            }
            return f;
        
        }
    }
}
