
extension String {
    func isPredecessor(of string: String) -> Bool {
        let n = self.count
        guard n + 1 == string.count else {
            return false
        }
        
        let charsPre = [Character](self),
            charsCur = [Character](string)
        var i = 0
        // 前面有几个相等
        while i < n && charsPre[i] == charsCur[i] {
            i += 1
        }
        // 跳开一个有几个相等
        while i < n && charsPre[i] == charsCur[i + 1] {
            i += 1
        }
        return i == n
    }
}

extension Array where Element == String {
    func longestStrChain() -> Int {
        let sortedWords = self.sorted {
            $0.count < $1.count
        }
        let n = sortedWords.count
        // 第 i 个 word 的最长链长度
        var dp = [Int](repeating: 1, count: n)
        for i in 0..<n {
            let wordCur = sortedWords[i]
            var j = i - 1
            // 倒序只遍历长度相差小于等于 1 的单词
            while j >= 0 && wordCur.count - sortedWords[j].count <= 1{
                if sortedWords[j].isPredecessor(of: wordCur) {
                    dp[i] = Swift.max(dp[i], dp[j] + 1)
                }
                j -= 1
            }
        }
        return dp.max() ?? 0
    }
}

class Solution {
    func longestStrChain(_ words: [String]) -> Int {
        words.longestStrChain()
    }
}
