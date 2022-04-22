class Solution {
    func triangularSum(_ nums: [Int]) -> Int {
        var nums = nums, n = nums.count
        while n > 0 {
            n -= 1
            for i in 0..<n {
                nums[i] = (nums[i] + nums[i + 1]) % 10
            }
        }
        return nums[0]
    }
}