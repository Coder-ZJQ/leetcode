class Solution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        let length = strs.count
        let repeating = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        var dp = [[[Int]]](repeating: repeating, count: length + 1)
        let zeroAndOnes: [(Int, Int)] = strs.map { str in
            var zero = 0, one = 0
            for c in str {
                if c == "0" {
                    zero += 1
                } else {
                    one += 1
                }
            }
            return (zero, one)
        }
        for i in 1...length {
            let zeroAndOne = zeroAndOnes[i - 1], zero = zeroAndOne.0, one = zeroAndOne.1
            for j in 0...m {
                for k in 0...n {
                    dp[i][j][k] = dp[i - 1][j][k]
                    if j >= zero && k >= one {
                        dp[i][j][k] = max(dp[i][j][k], dp[i - 1][j - zero][k - one] + 1)
                    }
                }
            }
        }
        return dp[length][m][n]
    }
}
