extension Character {
    var isVowel: Bool {
        self == "a" || self == "e" || self == "i" || self == "o" || self == "u" ||
        self == "A" || self == "E" || self == "I" || self == "O" || self == "U"
    }
}

class Solution {
    func sortVowels(_ s: String) -> String {
        let indexAndChars = s.enumerated().filter {
            $0.element.isVowel
        }
        
        let sortedVowels: [Character] = indexAndChars.sorted { cur, nxt in
            cur.element < nxt.element
        }.map(\.element)
        
        let indexes = indexAndChars.map(\.offset)
        
        var chars = [Character](s)
        
        for (index, vowel) in zip(indexes, sortedVowels) {
            chars[index] = vowel
        }
        
        return String(chars)
    }
}
