class Solution {
    func maximumXOR(_ nums: [Int]) -> Int {
        nums.reduce(nums[0], |)
    }
}
