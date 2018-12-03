using System;
using System.Collections.Generic;

namespace FrequencyFilter
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length == 0)
            {
                return;
            }
            string[] lines = System.IO.File.ReadAllLines(args[0]);
            int rowLength = lines.Length;

            int[] vectorNumbers = new int[rowLength];
            int[] currentRow = new int[rowLength];
            List<int> foundNumbers = new List<int>();

            int vector = 0;
            int? solution = null;
            int i = 0;
            foreach (string line in lines)
            {
                vectorNumbers[i] = int.Parse(line);
                vector += vectorNumbers[i];
                currentRow[i] += vector;
                i++;
            }

            solution = CheckIfNumberExists(foundNumbers, currentRow);
            // calculate all other rows
            while (solution == null)
            {
                foundNumbers.AddRange(currentRow);
                currentRow = CalculateNewRow(currentRow, vector);

                solution = CheckIfNumberExists(foundNumbers, currentRow);
            }

            Console.WriteLine($"Solution={solution}");

            Console.Read();
        }

        private static int? CheckIfNumberExists(List<int> foundNumbers, int[] currentRow)
        {
            for (int i = 0; i < currentRow.Length; i++)
            {
                if (foundNumbers.Contains(currentRow[i]) || currentRow[i] == 0)
                {
                    return currentRow[i];
                }
            }

            return null;
        }

        private static int[] CalculateNewRow(int[] currentRow, int vector)
        {
            int[] res = new int[currentRow.Length];

            for (int i = 0; i < currentRow.Length; i++)
            {
                res[i] = currentRow[i] + vector;
            }

            return res;
        }
    }
}
