class Solution {
    
    private func costOf(_ nums: [Int], _ cost: [Int], _ base: Int) -> Int {
        zip(nums, cost).reduce(0) { partialResult, numCost in
            partialResult + abs(numCost.0 - base) * numCost.1
        }
    }
    
    func minCost(_ nums: [Int], _ cost: [Int]) -> Int {
        var left = nums.min()!, right = nums.max()!
        var res = costOf(nums, cost, left)
        while left < right {
            let mid = left + (right - left) >> 1
            let costCur = costOf(nums, cost, mid)
            let costNxt = costOf(nums, cost, mid + 1)
            res = min(costCur, costNxt)
            if costCur > costNxt {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return res
    }
}