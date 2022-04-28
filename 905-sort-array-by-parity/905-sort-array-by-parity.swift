class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var left = 0, right = n - 1
        var nums = nums
        
        while left < right {
            while left < n && nums[left] % 2 == 0 {
                left += 1
            }
            
            while right > 0 && nums[right] % 2 == 1 {
                right -= 1
            }
            
            if left < right {
                (nums[left], nums[right]) = (nums[right], nums[left])
                left += 1
                right -= 1
            }
        }
        
        return nums
    }
}