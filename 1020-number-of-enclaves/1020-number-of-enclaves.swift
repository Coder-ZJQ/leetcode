class OceanIsland {
    private var grid: [[Int]]
    private let m: Int
    private let n: Int
    var enclaves: Int {
        guard m > 1 && n > 1 else {
            return 0
        }
        for i in 0..<m {
            dfs(i, 0)
            dfs(i, n - 1)
        }
        for j in 0..<n {
            dfs(0, j)
            dfs(m - 1, j)
        }
        var res = 0
        for i in 1..<m - 1 {
            for j in 1..<n - 1 where grid[i][j] == 1 {
                res += 1
            }
        }
        
        return res
    }
    init(_ grid: [[Int]]) {
        self.grid = grid
        m = grid.count
        n = grid.isEmpty ? 0 : grid[0].count
    }
    private func dfs(_ i: Int, _ j: Int) {
        guard i >= 0 && i < m && j >= 0 && j < n && grid[i][j] == 1 else {
            return
        }
        grid[i][j] = -1
        dfs(i + 1, j)
        dfs(i, j + 1)
        dfs(i - 1, j)
        dfs(i, j - 1)
    }
}

class Solution {
    func numEnclaves(_ grid: [[Int]]) -> Int {
        OceanIsland(grid).enclaves
    }
}