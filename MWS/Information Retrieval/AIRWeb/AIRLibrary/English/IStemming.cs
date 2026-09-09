using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AIRLibrary
{
    public interface IStemming
    {
        /// <summary>
        /// Returns the stemmed form of a word
        /// </summary>
        /// <param name="word">The word to stem. It must be capitalized</param>
        /// <returns>The stemmed word</returns>
        string StemWord(string word);
    }
}
