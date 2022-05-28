class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        // 异或操作
        nums.enumerated().reduce(nums.count) { partialResult, next in
            partialResult ^ next.element ^ next.offset
        }
    }
}
