class Solution {
    func optimalDivision(_ nums: [Int]) -> String {
        let count = nums.count
        guard count > 0 else { return "" }
        if count == 1 {
            return "\(nums[0])"
        }
        if nums.count == 2 {
            return "\(nums[0])/\(nums[1])"
        }
        var ans = "\(nums[0])/(\(nums[1])"
        for num in nums[2...] {
            ans += "/\(num)"
        }
        ans += ")"
        return ans
    }
}
