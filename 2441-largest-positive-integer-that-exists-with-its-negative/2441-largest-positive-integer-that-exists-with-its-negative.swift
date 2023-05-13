class Solution {
    func findMaxK(_ nums: [Int]) -> Int {
        var set = Set<Int>(), res = -1
        for num in nums {
            if set.contains(-num) {
                res = max(res, abs(num))
            }
            set.insert(num)
        }
        return res
    }
}