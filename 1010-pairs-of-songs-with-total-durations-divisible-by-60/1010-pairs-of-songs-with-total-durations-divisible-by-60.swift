class Solution {
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var counts = [Int](repeating: 0, count: 60)
        for num in time {
            counts[num % 60] += 1
        }
        let pair0 = counts[0]
        var res = pair0 * (pair0 - 1) / 2
        for i in 1...29 {
            res += counts[i] * counts[60 - i]
        }
        let pair30 = counts[30]
        res += pair30 * (pair30 - 1) / 2
        return res
    }
}
