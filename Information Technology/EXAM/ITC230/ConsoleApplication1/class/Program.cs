using System;
using System.Collections.Generic;

using System.Text;

namespace sum1_n
{
    class @for
    {
        static void Main(string[] args)
        {
            // Variable declaration

            double result ;//,num;
            //string sn, sNum;
            int n = 0;

            // Input
            Console.Write("The count number : ");
            n = readInt();// go to sub 1

            // Processing
            //int num;
            //for (int i = 1; i <= n; i++)
            //{

            //    num = readInt();
            //    res += num;
            //}
            result = sum(n);// go to sub 2
           // output

            Console.Write("Sum of integral ");
            Console.Write(n);
            Console.Write(" numbers is: ");
            Console.WriteLine(result);

            Console.ReadLine();
        }
        //Very IMportant
        //WE Can NOT return a variable that take by reference( ref int n) like
          // sub  error 
        //static int readInt( ref int n)
        //{
           
        //   return n;
        //}
            //the solution of this problem is 
        //static void  readInt(ref int n)// the  sub prog return value by ref
        //{
           
        //    .....}


        //or we can use also
        //    static int readInt(ref int n)
        //{
           
        //    .....
        // return 7;
        //}
            
            

        
        // sub 1
        static int readInt()
        {
           
            int n;
            Console.Write("Enter the number = ");
            
            n = int.Parse(Console.ReadLine());
            return n;// we must type return coz it's NOT void
        }

        //sub 2 
        static int sum(int count)
        {
            int num, res = 0;
            for (int i = 1; i <= count; i++)
            {

                num = readInt();
                res += num;
                // or we can type
                // res+=readInt();
            }
            return res;
        }
    }

}
