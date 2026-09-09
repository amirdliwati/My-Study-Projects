using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication2
{
    class Program
    {
        static void Main(string[] args)
        {
            int nb = (int)'B';
            int k;
            for (k = nb; k <= nb + 2; k++)
                Console.WriteLine((char)(k + 2) + ",");
            Console.ReadLine();
        }
    }
}
