using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Q2
{
    class Question2
    {
        static void Main(string[] args)
        {
            int a, b, c;
            a = 40;
            while (a != 0)
            {
                b = 30;
                while (b <= 40)
                {
                    c = a * a + b * b;
                    if (c == 2500 || c == 10000)
                        Console.WriteLine(a + "," + b + "," + c);
                    b = b + 10;
                }
                a = a - 10;
            } Console.ReadLine();

        }
    }
}
