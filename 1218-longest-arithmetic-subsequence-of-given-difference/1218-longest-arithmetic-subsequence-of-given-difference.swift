class Solution {
    func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
        var dp = [Int: Int]()
        for num in arr {
            dp[num] = dp[num - difference, default: 0] + 1
        }
        return dp.values.max() ?? 0
    }
}
