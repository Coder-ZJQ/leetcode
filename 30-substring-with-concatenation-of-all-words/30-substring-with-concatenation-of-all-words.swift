class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let windowSize = words.count * words[0].count
        guard s.count >= windowSize else {
            return []
        }
        var wordsFrequency = [String: Int]()
        for word in words {
            wordsFrequency[word] = wordsFrequency[word, default: 0] + 1
        }
        let chars = [Character](s), splitLength = words[0].count
        var res = [Int]()
        
        for i in 0...(s.count - windowSize) {
            var subStringFrequency = [String: Int](), shouldContinue = false
            for j in stride(from: i, to: i + windowSize, by: +splitLength) {
                let subString = String(chars[j..<(j + splitLength)])
                guard let _ = wordsFrequency[subString] else {
                    shouldContinue = true
                    break
                }
                subStringFrequency[subString] = subStringFrequency[subString, default: 0] + 1
            }
            if shouldContinue { continue }
            var match = true
            for (string, count) in subStringFrequency {
                guard let cnt = wordsFrequency[string], cnt == count else {
                    match = false
                    break
                }
            }
            if match {
                res.append(i)
            }
        }
        
        return res
    }
}