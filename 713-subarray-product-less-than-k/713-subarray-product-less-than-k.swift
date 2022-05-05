class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        guard k > 0 else { return 0 }
        let n = nums.count
        var left = 0,   // 窗口左边
            right = 0,  // 窗口右边
            result = 0, // 结果
            product = 1 // 乘积
        
        while right < n {
            product *= nums[right]
            while left <= right && product >= k {
                // 回溯移除左窗口乘积
                product /= nums[left]
                // 移动窗口左边界
                left += 1
            }
            result += right - left + 1
            right += 1
        }
        return result
    }
}
