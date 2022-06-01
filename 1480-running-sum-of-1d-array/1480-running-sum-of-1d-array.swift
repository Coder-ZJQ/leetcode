class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        let n = nums.count
        guard n > 1 else {
            return nums
        }
        var nums = nums
        for i in 1..<n {
            nums[i] += nums[i - 1]
        }
        return nums
    }
}
