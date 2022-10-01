class Solution {
    func numDecodings(_ s: String) -> Int {
        let chars = [Character](s), n = chars.count
        var dp = [Int](repeating: 0, count: n + 1)
        // 如果为空字符串，则解码出空字符串一种
        dp[0] = 1
        dp[1] = !chars.isEmpty && chars[0] == "0" ? 0 : 1
        guard n > 1 else { return dp[n] }
        for i in 2...n {
            let cur = chars[i - 1].asciiValue ?? 0,
                pre = chars[i - 2].asciiValue ?? 0
            // 在 1 ~ 9 之间
            if cur >= 49 && cur <= 57 {
                dp[i] += dp[i - 1]
            }
            if (pre == 49 && cur >= 48 && cur <= 57) || // 10 ~ 19
                (pre == 50 && cur >= 48 && cur <= 54) { // 20 ~ 26
                dp[i] += dp[i - 2]
            }
        }
        return dp[n]
    }
}
