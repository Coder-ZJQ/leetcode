class Solution {
    func maxAscendingSum(_ nums: [Int]) -> Int {
        var pre = nums.first!, res = pre, sum = pre
        for num in nums[1...] {
            if num > pre {
                sum += num
            } else {
                sum = num
            }
            pre = num
            res = max(res, sum)
        }
        return res
    }
}