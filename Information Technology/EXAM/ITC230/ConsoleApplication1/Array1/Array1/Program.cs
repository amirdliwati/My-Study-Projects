using System;
using System.Collections.Generic;
using System.Text;

namespace Array1
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] t1 = new int[5];
            t1[0] = -666;
            t1[1] = -344;
            t1[2] = -567;

            // read from array for
           for (int i = 0; i <= t1.Length-1; i++)
               t1[i] = 3 * i - 1; 

            //// read from array for
            //for (int i = 0; i <= 4; i++)
            
                //t1[i] = 3 * i - 1; /// one statement not need {}

            /// print array  as DESC
            for (int i = 4; i >= 0; i--)
            System.Console.WriteLine(t1[i]); /// one statement not need {}
           
            
            System.Console.ReadLine();

        }
    }
}
