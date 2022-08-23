class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        var set = Set<Int>(),
            res = 0
        for num in nums where num != 0 && !set.contains(num) {
            res += 1
            set.insert(num)
        }
        return res
    }
}
