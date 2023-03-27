class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var grid = grid
        let m = grid.count, n = grid[0].count
        for i in 1..<m {
            grid[i][0] += grid[i - 1][0]
        }
        for i in 1..<n {
            grid[0][i] += grid[0][i - 1]
        }
        for i in 1..<m {
            for j in 1..<n {
                grid[i][j] += min(grid[i - 1][j], grid[i][j - 1])
            }
        }
        return grid.last?.last ?? 0
    }
}