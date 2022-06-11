class Solution {
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        
        let sum = nums.reduce(0, +),
            target = sum - x
        guard target >= 0 else {
            return -1
        }
        let n = nums.count
        var maxLength = -1, curSum = 0
        var left = 0, right = 0
        while right < n {
            curSum += nums[right]
            while curSum > target {
                curSum -= nums[left]
                left += 1
            }
            if curSum == target {
                maxLength = max(maxLength, right - left + 1)
            }
            right += 1
        }
        return maxLength == -1 ? -1 : n - maxLength
    }
}