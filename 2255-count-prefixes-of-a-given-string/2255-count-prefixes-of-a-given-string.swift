class Solution {
    func countPrefixes(_ words: [String], _ s: String) -> Int {
        words.reduce(0) { result, word in
            s.hasPrefix(word) ? result + 1 : result
        }
    }
}
