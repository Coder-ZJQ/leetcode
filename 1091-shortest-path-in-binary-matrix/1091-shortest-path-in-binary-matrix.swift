class Solution {
    
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        let n = grid.count
        // 起点和终点不是 0 直接返回
        guard grid[0][0] == 0 && grid[n - 1][n - 1] == 0 else {
            return -1
        }
        // 8 个方向
        let helper = [(0, 1), (0, -1), (1, 0), (-1, 0), (1, -1), (-1, 1), (-1, -1), (1, 1)]
        // 记录每一步(x, y, 步数)
        var array = [(0, 0, 0)], grid = grid
        while !array.isEmpty {
            let cur = array.removeFirst()
            // 如果当前步数到达终点直接返回
            if cur.0 == n - 1 && cur.1 == n - 1 {
                return cur.2 + 1
            }
            for (num0, num1) in helper {
                // 下一步的 x y
                let x = cur.0 + num0, y = cur.1 +  num1
                // 没有越界，同时没有访问过
                if x < 0 || y < 0 || x >= n || y >= n || grid[x][y] != 0 { continue }
                // 置为 -1 表示已访问过
                grid[x][y] = -1
                array.append((x, y, cur.2 + 1))
            }
        }
        return -1
    }
}