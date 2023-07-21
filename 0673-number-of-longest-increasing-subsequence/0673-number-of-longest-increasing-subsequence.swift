class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        var res = 0, len = 0
        var dp = [Int](repeating: 1, count: n)
        var cnt = [Int](repeating: 1, count: n)
        for i in 0..<n {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    if dp[i] == dp[j] + 1 {
                        cnt[i] += cnt[j]
                    } else if dp[i] < dp[j] + 1 {
                        dp[i] = dp[j] + 1
                        cnt[i] = cnt[j]
                    }
                }
            }
            if len == dp[i] {
                res += cnt[i]
            } else if len < dp[i] {
                len = dp[i]
                res = cnt[i]
            }
        }
        return res
    }
}