class Solution {
    func maxRotateFunction(_ nums: [Int]) -> Int {
        let n = nums.count
        var sum = 0, res = 0
        for i in 0..<n {
            let num = nums[i]
            sum += num
            res += num * i
            
        }
        var dp = [Int](repeating: 0, count: n)
        dp[0] = res
        for i in 1..<n {
            let num = dp[i - 1] + sum - nums[n - i] * n
            dp[i] = num
            res = max(res, num)
        }
        return res
    }
}
