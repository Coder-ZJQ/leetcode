class Solution {
    func matrixSum(_ nums: [[Int]]) -> Int {
        let sorted = nums.map { $0.sorted() }
        var res = 0
        let m = sorted.count, n = sorted[0].count
        for i in 0..<n {
            var score = 0
            for j in 0..<m {
                score = max(score, sorted[j][i])
            }
            res += score
        }
        return res
    }
}
