class Solution {
    func intersection(_ nums: [[Int]]) -> [Int] {
        Array(nums[1...].reduce(into: Set(nums[0])) { partialResult, next in
            partialResult = partialResult.intersection(next)
        }).sorted()
    }
}
