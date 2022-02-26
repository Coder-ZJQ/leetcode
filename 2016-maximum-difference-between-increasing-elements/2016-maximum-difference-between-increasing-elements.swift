class Solution {
    func maximumDifference(_ nums: [Int]) -> Int {
        var pre = nums[0], res = -1
        for num in nums[1...] {
            res = max(res, num - pre)
            pre = min(pre, num)
        }
        return res == 0 ? -1 : res
    }
}
