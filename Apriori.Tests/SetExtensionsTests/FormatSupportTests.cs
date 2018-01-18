using System.Collections.Generic;
using FluentAssertions;
using Xunit;

namespace Apriori.Tests.SetExtensionsTests
{
    public sealed class FormatSupportTests
    {
        [Fact]
        public void ShouldFormatMultipleItems()
        {
            var set = new HashSet<string> { ">50K", "Master" };
            const int support = 3851;
            set.FormatSupport(support).Should().Be("3851:>50K, Master");
        }

        [Fact]
        public void ShouldFormatOneItems()
        {
            var set = new HashSet<string> { ">50K" };
            const int support = 3851;
            set.FormatSupport(support).Should().Be("3851:>50K");
        }
    }
}