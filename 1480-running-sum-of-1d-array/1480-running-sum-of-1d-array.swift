class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        let n = nums.count
        guard n > 1 else { return nums }
        var nums = nums
        for i in 1..<nums.count {
            nums[i] += nums[i - 1]
        }
        return nums
    }
}
