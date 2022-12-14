class Solution {
    func rob(_ nums: [Int]) -> Int {
        let count = nums.count
        guard count > 1 else { return nums[0] }
        var pre = nums[0],
            cur = max(pre, nums[1])
        for i in 2..<count {
            let temp = pre
            pre = cur
            cur = max(cur, nums[i] + temp)
        }
        return cur
    }
}