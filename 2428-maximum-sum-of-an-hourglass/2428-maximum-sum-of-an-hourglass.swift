class Solution {
    func maxSum(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var res = 0
        for i in 0..<m-2 {
            for j in 0..<n-2 {
                let sum = grid[i][j] + grid[i][j + 1] + grid[i][j + 2] +
                                       grid[i + 1][j + 1] +
                      grid[i + 2][j] + grid[i + 2][j + 1] + grid[i + 2][j + 2]
                res = max(res, sum)
            }
        }
        return res
    }
}