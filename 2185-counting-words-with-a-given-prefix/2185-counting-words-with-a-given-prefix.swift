class Solution {
    func prefixCount(_ words: [String], _ pref: String) -> Int {
        words.reduce(0) { partialResult, str in
            str.hasPrefix(pref) ? partialResult + 1 : partialResult
        }
    }
}
