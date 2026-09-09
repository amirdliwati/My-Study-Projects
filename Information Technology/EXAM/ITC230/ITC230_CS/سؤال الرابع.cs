using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication4
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] names = { "Ahmad", "Hassan", "Ziad", "Nizar", "Tara" };
            int[] sum = { 800, 1500, 200, 1000, 3000 };
            int p = mx(sum);
            Console.WriteLine(names[w(p, sum)]);
            Console.ReadLine();
        }
        static int mx(int[] a)
        {
            int m = a[0];
            for (int i = 0; i <= a.Length - 1; i++)
                if (a[i] > m)
                    m = a[i];
            return m;
        }
        static int w(int n, int[] a)
        {
            int k;
            for (k = 0; k <= a.Length - 1; k++)
                if (n == a[k])
                    break;
            if (k != a.Length)
                return k;
            else return -1;
        }
    }
}
