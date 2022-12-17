class Solution {
    func minElements(_ nums: [Int], _ limit: Int, _ goal: Int) -> Int {
        (abs(nums.reduce(0, +) - goal) + limit - 1) / limit
    }
}
