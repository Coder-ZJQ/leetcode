class Solution {
    func minMoves2(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted(),
            mid = nums.count / 2,
            midNum = sortedNums[mid]
        return sortedNums.reduce(0) { partialResult, num in
            partialResult + abs(midNum - num)
        }
    }
}
