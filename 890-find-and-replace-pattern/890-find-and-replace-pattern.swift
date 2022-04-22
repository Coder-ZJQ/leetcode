class Solution {
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        words.filter { string in
            guard string.count == pattern.count else { return false }
            var mapper = [Character: Character]()
            for (c0, c1) in zip(string, pattern) {
                if let val = mapper[c1] {
                    if val != c0 {
                        return false
                    }
                } else {
                    mapper[c1] = c0
                }
            }
            return Set(pattern).count == Set(mapper.values).count
        }
    }
}
