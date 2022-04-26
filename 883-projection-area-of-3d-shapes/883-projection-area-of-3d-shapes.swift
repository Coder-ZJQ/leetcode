class Solution {
    func projectionArea(_ grid: [[Int]]) -> Int {
        var top = 0, front = 0, side = 0
        for row in grid {
            var maxInRow = 0
            for col in row {
                if col > 0 {
                    top += 1
                }
                maxInRow = max(col, maxInRow)
            }
            side += maxInRow
        }
        
        let n = grid.count
        for col in 0..<n {
            var maxInCol = 0
            for row in 0..<n {
                let area = grid[row][col]
                maxInCol = max(area, maxInCol)
            }
            front += maxInCol
        }
        
        return top + front + side
    }
}
