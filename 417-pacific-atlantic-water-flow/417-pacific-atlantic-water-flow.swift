class Solution {
    
    private var heights = [[Int]]()
    private var canReachPacific = [[Bool]]()
    private var canReachAtlantic = [[Bool]]()
    private var m = 0
    private var n = 0
    
    private func bfsPacific(_ height: Int, _ row: Int, _ col: Int) {
        
        guard row >= 0 && row < m && col >= 0 && col < n && !canReachPacific[row][col] && heights[row][col] >= height else { return }
        let next = heights[row][col]
        canReachPacific[row][col] = true
        bfsPacific(next, row + 1, col)
        bfsPacific(next, row, col + 1)
        bfsPacific(next, row - 1, col)
        bfsPacific(next, row, col - 1)
        
    }
    
    
    private func bfsAtlantic(_ height: Int, _ row: Int, _ col: Int) {
        
        guard row >= 0 && row < m && col >= 0 && col < n && !canReachAtlantic[row][col] && heights[row][col] >= height else { return }
        let next = heights[row][col]
        canReachAtlantic[row][col] = true
        bfsAtlantic(next, row + 1, col)
        bfsAtlantic(next, row, col + 1)
        bfsAtlantic(next, row - 1, col)
        bfsAtlantic(next, row, col - 1)
        
    }
    
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        self.heights = heights
        self.m = heights.count
        self.n = heights[0].count
        canReachPacific = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        canReachAtlantic = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        
        // 上下
        for i in 0..<n {
            bfsPacific(0, 0, i)
            bfsAtlantic(0, m - 1, i)
        }
        // 左右
        for i in 0..<m {
            bfsPacific(0, i, 0)
            bfsAtlantic(0, i, n - 1)
        }
        
        var res = [[Int]]()
        for i in 0..<m {
            for j in 0..<n where canReachPacific[i][j] && canReachAtlantic[i][j] {
                res.append([i, j])
            }
        }
        return res
    }
}