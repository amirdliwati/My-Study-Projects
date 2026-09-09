using System;
using System.Collections.Generic;

using System.Text;

namespace Bubble_Sort
{
    class Program
    {
        static void Main(string[] args)
        {
            // V D
            int temp, n;
            string sn;
            int[] bubbleSortTable;

            //input
            System.Console.Write("Enter length of table = ");
            sn = System.Console.ReadLine();
            n = int.Parse(sn);

            bubbleSortTable = new int[n];

            //read elements of table
            for (int i = 0; i < n; i++)
            {
                System.Console.Write("Enter number of index ( ");
                System.Console.Write(i);
                System.Console.Write(" ) = ");
                bubbleSortTable[i] = int.Parse(System.Console.ReadLine());
            }
            System.Console.WriteLine();

            //processing
            //sort numbers
            for (int i = 0; i < n-1; i++)
            {
                for (int j = 1; j < n - i; j++)
                {
                    if (bubbleSortTable[j] < bubbleSortTable[j - 1])
                    {
                        temp = bubbleSortTable[j - 1];
                        bubbleSortTable[j - 1] = bubbleSortTable[j];
                        bubbleSortTable[j] = temp;
                    }
                }
            }
            //read elements of table
            for (int i = 0; i < n; i++)
            {
                System.Console.WriteLine(bubbleSortTable[i]);
            }
            System.Console.ReadLine();

        }
    }
}
