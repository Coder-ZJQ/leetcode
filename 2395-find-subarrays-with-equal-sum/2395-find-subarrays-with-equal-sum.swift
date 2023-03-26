class Solution {
    func findSubarrays(_ nums: [Int]) -> Bool {
        var set = Set<Int>()
        for i in 1..<nums.count {
            if !set.insert(nums[i] + nums[i - 1]).inserted {
                return true
            }
        }
        return false
    }
}
