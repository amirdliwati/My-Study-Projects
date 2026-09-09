using System;
using System.Collections.Generic;
using System.Text;

namespace yaso
{
    class Program
    {
        

            static void Main(string[] args)
        {
            int max=0, average = 0,counter=0,loop=0;
            int[] Consume =new int[1000];
            double[] price = new double[1000];
            string[] name = new string[1000];
            for (int i = 0; i <= Consume.Length-1; i++)
            {
                Console.Write("the consumption:   ");
                Consume[i] = Convert.ToInt32(Console.ReadLine());
                if (Consume[i] > 0)
                {
                    average = average + Consume[i];
                    Console.Write("the name:   ");
                    name[i] = Console.ReadLine();
                    if (max < Consume[i])
                    {
                        max = Consume[i];
                        loop = i;
                    }
                    if (Consume[i] < 1000)
                    {
                        price[i] = Consume[i] * 1.5;

                    }
                    else if(Consume[i] >= 1000 && Consume[i] <= 2000)
                    {
                        price[i]= Consume[i] * 2.5;

                    }
                    else
                    {
                        price[i]= Consume[i] * 5;

                    }

                }
                else
                    break;
                counter ++;
            }
            Console.WriteLine("Name" + "\t\t" + "Consume" + "\t\t" + "Price");
            for (int i = 0; i < counter; i++)
            {
                Console.WriteLine(name[i] + "\t\t" + Consume[i] + "\t\t" + price[i]);
            }
            Console.WriteLine("Te average is :  " + (double)average / counter);
            Console.WriteLine("The Name Of The Max consumption is :   " + name[loop]);

            System.Console.ReadLine();
        }

        }
    }

