class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let n = nums.count
        var left = -1, right = -1, maxNum = Int.min, minNum = Int.max
        for i in 0..<n {
            if maxNum > nums[i] {
                right = i
            } else {
                maxNum = nums[i]
            }

            if minNum < nums[n - 1 - i] {
                left = n - 1 - i
            } else {
                minNum = nums[n - 1 - i]
            }
        }
        return right == -1 ? 0 : right - left + 1
    }
}