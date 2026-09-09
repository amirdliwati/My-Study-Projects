using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Q1
{
    class Question1
    {
        static void Main(string[] args)
        {
            int m = 1;
            int s = 0;
            while (m <= 12)
            {
                if ((m % 3) == 0)
                    s = s + 1;
                m = m + 1;
            }
            Console.WriteLine(s);
            Console.ReadLine();
        }
    }
}
