extension String {
    func isPredecessor(of string: String) -> Bool {
        let n = self.count
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

class Solution {
    func longestStrChain(_ words: [String]) -> Int {
        var countMap = [Int: [String]]()
        for word in words {
            if let _ = countMap[word.count] {
                countMap[word.count]!.append(word)
            } else {
                countMap[word.count] = [word]
            }
        }
        var dp = [String: Int]()
        var res = 1
        for i in countMap.keys.sorted() {
            if let preWords = countMap[i - 1] {
                let curWords = countMap[i]!
                for curWord in curWords {
                    for preWord in preWords {
                        if preWord.isPredecessor(of: curWord) {
                            let count = max(dp[curWord, default: 1], dp[preWord, default: 1] + 1)
                            dp[curWord] = count
                            res = max(res, count)
                        }
                    }
                }
            }
        }
        return res
    }
}
