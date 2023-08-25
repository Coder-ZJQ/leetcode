class Solution {

    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let m = s1.count, n = s2.count
        guard m + n == s3.count else {
            return false
        }
        
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true
        
        let chars1 = [Character](s1),
            chars2 = [Character](s2),
            chars3 = [Character](s3)
        
        for i in 0...m {
            for j in 0...n {
                let k = i + j - 1
                if i != 0 {
                    dp[i][j] = dp[i][j] || (dp[i-1][j] && chars1[i - 1] == chars3[k])
                }
                if j != 0 {
                    dp[i][j] = dp[i][j] || (dp[i][j-1] && chars2[j - 1] == chars3[k])
                }
            }
        }
        return dp[m][n]
    }
}