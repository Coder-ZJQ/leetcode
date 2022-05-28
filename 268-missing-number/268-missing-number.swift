class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        (0...nums.count).reduce(0, +) - nums.reduce(0, +)
    }
}
