class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let n = s.count, chars = [Character](s)
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        for i in (0..<n).reversed() {
            dp[i][i] = 1
            let charI = chars[i]
            for j in i+1..<n {
                let charJ = chars[j]
                if charI == charJ {
                    dp[i][j] = dp[i + 1][j - 1] + 2
                } else {
                    dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[0][n - 1]
    }
}