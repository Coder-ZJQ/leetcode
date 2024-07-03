class Solution {
    func minDifference(_ nums: [Int]) -> Int {
        guard nums.count > 4 else {
            return 0
        }
        
        var minDiff = Int.max
        let sortedNums = nums.sorted(), n = nums.count
        for i in 0..<4 {
            let left = i, right = i + n - 4
            minDiff = min(minDiff, sortedNums[right] - sortedNums[left])
        }
        return minDiff
    }
}
