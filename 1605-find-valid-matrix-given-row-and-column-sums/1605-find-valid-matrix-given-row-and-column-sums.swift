class Solution {
    func restoreMatrix(_ rowSum: [Int], _ colSum: [Int]) -> [[Int]] {
        var rowSum = rowSum, colSum = colSum
        let rows = rowSum.count, cols = colSum.count
        var res = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)
        for row in 0..<rows {
            for col in 0..<cols {
                res[row][col] = min(rowSum[row], colSum[col])
                rowSum[row] -= res[row][col]
                colSum[col] -= res[row][col]
            }
        }
        return res
    }
}
