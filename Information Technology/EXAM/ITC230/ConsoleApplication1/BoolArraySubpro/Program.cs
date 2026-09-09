using System;

namespace Arrays
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] m;
            int length;

            // read element
            Console.Write("Enter length of array: ");
            length = int.Parse(Console.ReadLine());

            //make new array to store the result
            m = new int[length];


            int n;
            bool b = false;
            
            
            // Read array elements
            Console.WriteLine("Read array elements: ");
            for (int i = 0; i < m.Length; i++)
            {
                Console.Write(" enter number: ");
                m[i] = int.Parse(Console.ReadLine());
            }
            // Processing
            while (!b)/// !b mean not enter the while loop coz the condintion must be true the enter the loop 
            {
                Console.Write("To find number Enter it: ");
                n = int.Parse(Console.ReadLine());


                for (int i = 0; i < m.Length-1; i++)
                    if (n == m[i])
                    {
                        b = true;
                        Console.WriteLine("index of " + n + " is " + i);
                        break;// if we find the index use beak to end the loop 
                    }
                if (b == false)
                    Console.WriteLine("Value does not exists!");

            }
            Console.ReadLine();

        }
    }
}
