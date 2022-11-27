class Solution {
    func check(_ nums: [Int]) -> Bool {
        let n = nums.count
        guard n > 1 else { return true }
        /// 后一个数比前一个数小的数量
        var count = 0
        for i in 1..<n where nums[i] < nums[i - 1] {
            count += 1
        }
        return count == 0 || (count == 1 && nums[0] >= nums[n - 1])
    }
}