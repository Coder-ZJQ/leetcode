class Solution {
    private var charCounts: [(Character, Int)] = []
    private func check(_ word: String) -> Bool {
        let n = word.count, chars = [Character](word + ".")
        var i = 0, count = 1
        for j in 0..<n {
            guard i < charCounts.count else {
                return false
            }
            if chars[j] != chars[j + 1] {
                if chars[j] != charCounts[i].0 {
                    return false
                }
                if (count == charCounts[i].1 || (charCounts[i].1 > count && charCounts[i].1 >= 3)) {
                    i += 1
                    count = 1
                } else {
                    return false
                }
            } else {
                count += 1
            }
        }
        return i == charCounts.count
    }
    private func generateCharCounts(_ s: String) {
        let chars = [Character](s + ".")
        var count = 1
        for i in 0..<s.count {
            if chars[i] != chars[i + 1] {
                charCounts.append((chars[i], count))
                count = 1
            } else {
                count += 1
            }
        }
        
    }
    func expressiveWords(_ s: String, _ words: [String]) -> Int {
        generateCharCounts(s)
        return words.reduce(0) { partialResult, word in
            check(word) ? partialResult + 1 : partialResult
        }
    }
}