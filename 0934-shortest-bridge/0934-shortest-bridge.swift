class OceanIsland {
    
    private var grid: [[Int]]
    private var m: Int
    private var n: Int
    
    /// 组成第一个岛的坐标数组
    private var island0 = [(Int, Int)]()
    
    private func makeIsland(_ row: Int, _ col: Int) {
        guard row >= 0 && row < m && col >= 0 && col < n && grid[row][col] == 1 else {
            return
        }
        grid[row][col] = -1
        island0.append((row, col))
        makeIsland(row + 1, col)
        makeIsland(row, col + 1)
        makeIsland(row - 1, col)
        makeIsland(row, col - 1)
    }
    
    
    var shortestBridge: Int {
        for row in 0..<m {
            for col in 0..<n where grid[row][col] == 1{
                makeIsland(row, col)
                break
            }
            if !island0.isEmpty {
                break
            }
        }
        var step = 0
        let directions = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        // 扩大第一个岛的范围，如果碰到 1 则表示搭上桥
        while !island0.isEmpty {
            var array = [(Int, Int)]()
            for (row, col) in island0 {
                for direction in directions {
                    let x = row + direction.0,
                        y = col + direction.1
                    
                    guard x >= 0 && x < m && y >= 0 && y < n else {
                        continue
                    }
                    let val = grid[x][y]
                    if val == 0 {
                        grid[x][y] = -1
                        array.append((x, y))
                    } else if val == 1 {
                        return step
                    }
                }
            }
            island0 = array
            step += 1
            
        }
        return 0
    }
    
    init(_ grid: [[Int]]) {
        self.grid = grid
        m = grid.count
        n = grid.isEmpty ? 0 : grid[0].count
    }
}


class Solution {
    func shortestBridge(_ grid: [[Int]]) -> Int {
        OceanIsland(grid).shortestBridge
    }
}