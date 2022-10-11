class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        guard nums.count >= 3 else {
            return false
        }
        var pre = Int.max, mid = Int.max
        for cur in nums {
            if cur > mid {
                return true
            }
            if cur > pre {
                mid = min(cur, mid)
            }
            pre = min(cur, pre)
            
        }
        return false
    }
}
