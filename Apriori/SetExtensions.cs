using System;
using System.Collections.Generic;
using System.Text;

namespace Apriori
{
    public static class SetExtensions
    {
        public static string Format(this ISet<string> set)
        {
            if(set == null) throw new ArgumentNullException(nameof(set));

            var builder = new StringBuilder();
            builder.Append("{ ");
            var isFirstItem = true;
            foreach (var item in set)
            {
                if (!isFirstItem)
                {
                    builder.Append(", ");
                }
                builder.Append(item);
                isFirstItem = false;
            }
            builder.Append(" }");
            return builder.ToString();
        }

        public static string FormatSupport(this ISet<string> set, int support)
        {
            if (set == null) throw new ArgumentNullException(nameof(set));
            if(support < 0) throw new ArgumentOutOfRangeException(nameof(support));

            var builder = new StringBuilder();
            builder.AppendFormat("{0}:", support);
            var isFirstItem = true;
            foreach (var item in set)
            {
                if (!isFirstItem)
                {
                    builder.Append(", ");
                }
                builder.Append(item);
                isFirstItem = false;
            }
            return builder.ToString();
        }
    }
}