class Solution {
    func check(_ nums: [Int]) -> Bool {
        let n = nums.count
        guard n > 1 else { return true }
        var index: Int?
        for i in 1..<n where nums[i] < nums[i - 1] {
            index = i
            break
        }
        guard let i = index else { return true }
        for j in (i + 1)..<n where nums[j] < nums[j - 1] {
            return false
        }
        return nums[0] >= nums[n - 1]
    }
}