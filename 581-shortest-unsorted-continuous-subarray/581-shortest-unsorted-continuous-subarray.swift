class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let n = nums.count
        var left = -1, right = -1, maxNum = Int.min, minNum = Int.max
        for i in 0..<n {
            var num = nums[i]
            if maxNum > num {
                right = i
            } else {
                maxNum = num
            }
            num = nums[n - 1 - i]
            if minNum < num {
                left = n - 1 - i
            } else {
                minNum = num
            }
        }
        return right == -1 ? 0 : right - left + 1
    }
}