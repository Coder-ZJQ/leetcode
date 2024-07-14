class Solution {
    func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
        /// n x n 矩阵
        let n = grid.count
        /// 横向最大高度
        let rowMaxHeight = grid.map {
            $0.max()!
        }
        /// 竖向最大高度
        let colMaxHeight = (0..<n).map { i in
            var maxHeight = Int.min
            for j in 0..<n {
                maxHeight = max(maxHeight, grid[j][i])
            }
            return maxHeight
        }
        
        var res = 0
        for i in 0..<n {
            for j in 0..<n {
                // 不能超过横向及纵向最高高度，所以取其最小值减去当前高度即为可补充高度
                res += (min(rowMaxHeight[i], colMaxHeight[j]) - grid[i][j])
            }
        }
        return res
    }
}
