class Solution {
    func maximumCount(_ nums: [Int]) -> Int {
        var neg = 0, pos = 0
        for num in nums {
            if num > 0 {
                pos += 1
            } else if num < 0 {
                neg += 1
            }
        }
        return max(neg, pos)
    }
}
