class Solution {
    func knightProbability(_ n: Int, _ k: Int, _ row: Int, _ column: Int) -> Double {
        guard k > 0 else { return 1.0 }
        // 可移动的八个方向
        let directions = [(1, 2), (-1, 2), (1, -2), (-1, -2), (2, 1), (-2, 1), (2, -1), (-2, -1)]
        var dp = [[Double]](repeating: [Double](repeating: 0.0, count: n), count: n)
        dp[row][column] = 1.0
        for _ in 1...k {
            var nxt = [[Double]](repeating: [Double](repeating: 0.0, count: n), count: n)
            for i in 0..<n {
                for j in 0..<n {
                    for direction in directions {
                        let r = i + direction.0,
                            c = j + direction.1
                        if r >= 0 && c >= 0 && r < n && c < n {
                            nxt[i][j] += dp[r][c] / 8.0
                        }
                    }
                }
            }
            dp = nxt
        }
        return dp.reduce(0.0) { partialResult, next in
            partialResult + next.reduce(0.0, +)
        }
    }
}