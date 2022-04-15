class Solution {
    func maxCoins(_ piles: [Int]) -> Int {
        let n = piles.count / 3
        let sorted = piles.sorted(by: >)
        var res = 0
        for i in 0..<n {
            res += sorted[i * 2 + 1]
        }
        return res
    }
}
