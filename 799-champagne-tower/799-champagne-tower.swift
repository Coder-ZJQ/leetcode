class Solution {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var dp = [[Double]](repeating: [Double](repeating: 0.0, count: 101), count: 101)
        dp[0][0] = Double(poured)
        // 从第一层开始往下分
        for i in 0..<100 {
            for j in 0...i {
                if dp[i][j] >= 1 {
                    // 去除当前杯子的香槟的一半
                    let half = (dp[i][j] - 1) / 2.0
                    // 分给下一层
                    dp[i + 1][j] += half
                    dp[i + 1][j + 1] += half
                    dp[i][j] = 1
                }
            }
        }
        return dp[query_row][query_glass]
    }
}
