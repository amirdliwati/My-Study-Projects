using System;
using System.Collections.Generic;
using System.Text;

namespace SubPrograms
{
    class Program
    {
        static void Main(string[] args)
        {
            welcome();
            System.Console.WriteLine();
            System.Console.WriteLine();

            System.Console.WriteLine(" the Length of array is 6 ");
            int n=6;// length of the array
            System.Console.WriteLine();
            int []b;
            b=new int[n];

            System.Console.WriteLine(" plz enter the element in the array");
            b=ReadArray(n);// we use here b coz we need return value in sub program

            System.Console.WriteLine();
            int i, m;

            // print array
            for (i = 0; i <= n - 1; i++)
            {
                System.Console.Write(b[i] + " ,  ");
 
            }
            System.Console.WriteLine();

            System.Console.WriteLine();
            System.Console.WriteLine(" to get the min of the element u enter it");
            System.Console.WriteLine(" the minimum is " + min(b));// subprogram

            System.Console.WriteLine();
            System.Console.WriteLine();
            System.Console.WriteLine(" to get the mod of each element in the array");
            m = readinteger(); //subprogram


            aMod(m, b); // subprogram, // b is array ,m is mod
            System .Console .WriteLine ( "after aMod: ");
            System.Console.WriteLine();

            // print array
            for (i = 0; i <= n - 1; i++)
            { 
                System .Console .Write (b[i]+ ", ");
            
            }
            System.Console.WriteLine();

            System.Console.WriteLine(" to get the GCD of the numbers");
            int x = readinteger();// go to subprogram
            int y = readinteger();// go to subprogram
            System.Console.WriteLine();
            System.Console.WriteLine("X= " + x + "y= " + y + "gcd= " + gcd(x, y));// go to subprogram
            System.Console.WriteLine();
            System.Console.ReadLine();
        }

        //sub 1
        static void welcome()
        {
            System.Console.WriteLine("Hellooooo Eng.Ula");
        }

        // sub 2
        static int readinteger()
        {
            int a;
            System.Console.Write(" plz Enter integer Number: ");
            a = int.Parse(System.Console.ReadLine());

            return a;
        }

        // sub 3
        static int[] ReadArray(int n) // n is length of array
        {
            int[] a;
            a = new int[n]; // n is length of array that we get it from Main Program

            for (int i = 0; i <= n - 1; i++)
            {
                a[i] = readinteger();
            }
            return a;
        }
        

            // sub 4
            static void  aMod ( int k, int [] v)
            { 
                // replace v[i] by v[i] mod k

                for (int i = 0; i <= v.Length - 1; i++) // we use length coz we not enter parameter of length
                 v[i] = v[i] % k; 
            }

            // sub 5
        static int gcd(int a, int b)
        {
            while ((a != 0) && (b != 0))
                if (a > b)
                    a = a % b;
                else
                    b = b % a;

            if (a == 0)
                return b;
            else
                return a;
        
        }

        // sub 6
        static int min(int []a) // coz we need min item in the array
        {
           
            int m = a[0];

            for (int i = 0; i <= a.Length - 1; i++) // plz see a.length coz here not enter parameter of length
            {
                if (a[i] < m)
                    m = a[i];
            }
            return m;
        }
    }


}
