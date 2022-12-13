class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var dp = matrix
        let n = matrix.count
        for row in 1..<n {
            for col in 0..<n {
                var pre = dp[row - 1][col]
                if col != 0 {
                    pre = min(pre, dp[row - 1][col - 1])
                }
                if col != n - 1 {
                    pre = min(pre, dp[row - 1][col + 1])
                }
                dp[row][col] += pre
            }
        }
        return dp.last?.min() ?? 0
    }
}
