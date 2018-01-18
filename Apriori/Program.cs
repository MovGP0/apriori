using System.Collections.Generic;
using System.Collections.Immutable;
using System.IO;
using System.Linq;

namespace Apriori
{
    internal class Program
    {
        private static void Main()
        {
            var transactions = new FileTransactionsLoader().Load().ToImmutableArray();

            OutputFrequentItems(transactions);
        }

        /// <summary>
        /// Outputs all the length-1 frequent items (itemsets containing only one element) 
        /// with their absolute supports into a textfile named "oneItems.txt"
        /// </summary>
        /// <param name="transactions"></param>
        private static void OutputFrequentItems(ImmutableArray<ISet<string>> transactions)
        {
            const string fileName = "oneItems.txt";
            var result = transactions
                            .ExtractFeatures()
                            .FilterByFrequency(transactions)
                            .Select(feature => feature.FormatSupport(transactions.Support(feature)));

            WriteLinesToFile(result, fileName);
        }

        private static void WriteLinesToFile(IEnumerable<string> result, string fileName)
        {
            var directory = Directory.GetCurrentDirectory();
            var filePath = Path.Combine(directory, fileName);
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }

            using (var file = new StreamWriter(filePath))
            {
                foreach (var line in result)
                {
                    file.WriteLineAsync(line).Wait();
                }
            }
        }
    }
}
