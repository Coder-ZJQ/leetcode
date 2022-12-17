class Solution {
    func onesMinusZeros(_ grid: [[Int]]) -> [[Int]] {
        let m = grid.count,
            n = grid[0].count,
            mn = m + n
        
        var onesRow = [Int](repeating: 0, count: m),
            onesCol = [Int](repeating: 0, count: n),
            res = grid
        
        for row in 0..<m {
            for col in 0..<n {
                if res[row][col] == 1 {
                    onesRow[row] += 1
                    onesCol[col] += 1
                }
            }
        }

        for row in 0..<m {
            for col in 0..<n {
                res[row][col] = onesRow[row] * 2 + onesCol[col] * 2 - mn
            }
        }
        
        return res
    }
}
