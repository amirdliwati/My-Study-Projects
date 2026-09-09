using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace array2
{
    class Program
    {
        static void Main(string[] args)
        {
            //VD
            int n, p, sumRow, sumColumn;
            int[,] table;

            //input
            System.Console.Write("n = ");
            n = int.Parse(System.Console.ReadLine());

            System.Console.WriteLine();

            System.Console.Write("p = ");
            p = int.Parse(System.Console.ReadLine());

            System.Console.WriteLine();

            table = new int[n, p];

            //read elements of table
            for (int i = 0; i < n; i++)
            {
                for (int j = 0; j < p; j++)
                {
                    System.Console.Write("element [ ");
                    System.Console.Write(i);
                    System.Console.Write(" , ");
                    System.Console.Write(j);
                    System.Console.Write(" ] = ");
                    table[i, j] = int.Parse(System.Console.ReadLine());
                }
                System.Console.WriteLine();
            }

            //processing
            sumRow = 0;
            sumColumn = 0;
            for (int i = 0; i < n; i++)
            {
                for (int j = 0; j < p; j++)
                {
                    sumRow += table[i, j];
                }

                System.Console.Write("Sum of Row ");
                System.Console.Write(i + 1);
                System.Console.Write(" = ");
                System.Console.WriteLine(sumRow);
                sumRow = 0;
            }
            for (int i = 0; i < p; i++)
            {
                for (int j = 0; j < n; j++)
                {
                    sumColumn += table[j, i];
                }

                System.Console.Write("Sum of Column ");
                System.Console.Write(i + 1);
                System.Console.Write(" = ");
                System.Console.WriteLine(sumColumn);

                sumColumn = 0;
            }


            System.Console.ReadLine();
        }
    }
}
