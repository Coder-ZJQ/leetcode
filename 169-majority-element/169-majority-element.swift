class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var result = nums[0], count = 1
        for num in nums[1...] {
            if count == 0 {
                count = 1
                result = num
            } else if result == num {
                count += 1
            } else {
                count -= 1
            }
        }
        return result
    }
}
