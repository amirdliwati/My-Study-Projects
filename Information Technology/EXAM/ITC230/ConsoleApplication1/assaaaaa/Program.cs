using System;

namespace Arrays
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] m;
            int length;

            // read length
            Console.Write("Enter length of array: ");
            length = readInt();

            //make new array to store the result
            m = new int[length];


            int n, index;
            bool b = false;


            // Read array elements
            Console.WriteLine("Read array elements: ");
            m = ReadArray(length);// we can use m or another variable


            //for (int i = 0; i < m.Length; i++)
            //{
            //    Console.Write(" enter number: ");
            //    m[i] = readInt();
            //}
            // Processing
            index = -1;
            while (!b)/// !b mean not enter the while loop coz the condintion must be true to enter the loop 
            {
                Console.Write("To find number Enter it: ");
                n = readInt();// go to sub 1

                index = Find(m, n);// go to sub 3


                // the index must return possetive num
                if (index > 0)
                {
                    b = true;
                    System.Console.WriteLine("index of " + n + " is " + index);
                }
                // we can type here 
                else
                    Console.WriteLine("Value does not exists!");



                //for (int i = 0; i < m.Length; i++)
                //    if (n == m[i])
                //    {
                //        b = true;
                //        Console.WriteLine("index of " + n + " is " + i);
                //        break;// if we find the index use beak to end the loop 
                //    }
                //////if (b == false)
                //////    Console.WriteLine("Value does not exists!");

            }
            Console.ReadLine();

        }
        // sub 1
        static int readInt()
        {

            int n;
            Console.Write("Enter the number = ");

            n = int.Parse(Console.ReadLine());
            return n;// we must type return coz it's NOT void
        }

        //sub 2
        static int[] ReadArray(int length)
        {
            int[] m = new int[length];
            for (int i =1; i <= m.Length; i++)
            {
                //Console.Write(" enter number: ");
                m[i] = readInt();
            }
            return m;
        
        }

        // sub 3
        static int Find(int[] m, int n)// n is num that we want to find index
        {
            int index= -1;
            for (int i = 1; i <= m.Length; i++)
            {
                if (n == m[i])
                {
                    index = i;
                    break;
                }
            
            }
            return index;
        
        
        }

    }
}
