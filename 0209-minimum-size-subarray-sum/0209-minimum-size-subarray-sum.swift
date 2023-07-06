class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        let n = nums.count
        var left = 0, right = 0, res = n + 1, sum = nums[0]
        while left <= right, right < n {
            if sum < target {
                right += 1
                if right >= n {
                    break
                }
                sum += nums[right]
            } else {
                res = min(res, right - left + 1)
                sum -= nums[left]
                left += 1
            }
        }
        return res > n ? 0 : res
    }
}