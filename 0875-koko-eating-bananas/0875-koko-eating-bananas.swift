class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1, r = piles.max()!
        while l < r {
            let mid = l + (r - l) >> 1
            var hours = 0
            for pile in piles {
                hours += (pile + mid - 1) / mid
            }
            if hours <= h {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return r
    }
}
