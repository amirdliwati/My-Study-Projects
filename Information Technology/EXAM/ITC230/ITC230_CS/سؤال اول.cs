using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication3
{
    class Program
    {
        static void Main(string[] args)
        {
            int y = 5;
            Console.WriteLine(v(y, 7));
            Console.ReadLine();
        }
        public static int v(int x, int k)
        {
            return x + k % 2;
            
        }
    }
}

