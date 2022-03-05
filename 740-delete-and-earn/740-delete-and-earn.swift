class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        for num in nums {
            dict[num] = dict[num, default: 0] + num
        }
        guard dict.count > 1 else { return dict.first?.value ?? 0 }
        let n = dict.max {
            $0.key < $1.key
        }!.key
        // house robber: https://leetcode.com/problems/house-robber/
        var first = dict[0] ?? 0,
            second = max(dict[0] ?? 0, dict[1] ?? 0)
        for i in 2...n {
            let sum = dict[i] ?? 0
            (first, second) = (second, max(second, first + sum))
        }
        return second
    }
}