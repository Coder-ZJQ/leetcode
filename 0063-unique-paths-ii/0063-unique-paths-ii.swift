class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count, n = obstacleGrid[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        for i in 0..<m {
            guard obstacleGrid[i][0] == 0 else { break }
            dp[i][0] = 1
        }
        for i in 0..<n {
            guard obstacleGrid[0][i] == 0 else { break }
            dp[0][i] = 1
        }
        for row in 1..<m {
            for col in 1..<n where obstacleGrid[row][col] == 0 {
                dp[row][col] = dp[row - 1][col] + dp[row][col - 1]
            }
        }
        return dp[m - 1][n - 1]
    }
}