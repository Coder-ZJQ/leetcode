class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let chars1 = [Character](word1), m = chars1.count
        let chars2 = [Character](word2), n = chars2.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 0..<m {
            for j in 0..<n {
                if chars1[i] == chars2[j] {
                    dp[i + 1][j + 1] = dp[i][j] + 1
                } else {
                    dp[i + 1][j + 1] = max(dp[i + 1][j], dp[i][j + 1])
                }
            }
        }
        return m + n - dp[m][n] * 2
    }
}