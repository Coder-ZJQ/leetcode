class Solution {
    func rob(_ nums: [Int]) -> Int {
        let count = nums.count
        guard count > 1 else { return nums[0] }
        var first = nums[0],
            second = max(nums[0], nums[1])
        for i in 2..<count {
            (first, second) = (second, max(second, nums[i] + first))
        }
        return second
    }
}