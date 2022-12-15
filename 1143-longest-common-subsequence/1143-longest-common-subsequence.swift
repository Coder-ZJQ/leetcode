class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let char1 = [Character](text1), m = text1.count
        let char2 = [Character](text2), n = text2.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 0..<m {
            for j in 0..<n {
                if char1[i] == char2[j] {
                    dp[i + 1][j + 1] = dp[i][j] + 1
                } else {
                    dp[i + 1][j + 1] = max(dp[i][j + 1], dp[i + 1][j])
                }
            }
        }
        return dp[m][n]
    }
}