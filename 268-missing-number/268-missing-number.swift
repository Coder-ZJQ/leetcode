class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        // 异或操作
        nums.reduce(0, ^) ^ (0...nums.count).reduce(0, ^)
    }
}
