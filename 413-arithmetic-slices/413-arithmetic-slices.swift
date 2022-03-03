class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n >= 3 else { return 0 }
        var result = 0
        for i in 0..<n {
            var right = i + 1
            while right - 1 >= 0 && right + 1 < n && nums[right] - nums[right - 1] == nums[right + 1] - nums[right]  {
                right += 1
                result += 1
            }
        }
        return result
    }
}
