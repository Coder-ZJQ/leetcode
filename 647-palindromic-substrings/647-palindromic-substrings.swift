class Solution {
    func countSubstrings(_ s: String) -> Int {
        let chars = [Character](s)
        let n = chars.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var res = 0
        for j in 0..<n {
            for i in 0...j {
                if chars[i] == chars[j] && (j - i <= 1 || dp[i + 1][j - 1]) {
                    dp[i][j] = true
                    res += 1
                }
            }
        }
        return res
    }
}
