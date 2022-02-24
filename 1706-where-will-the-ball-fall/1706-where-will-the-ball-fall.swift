class Solution {
    func findBall(_ grid: [[Int]]) -> [Int] {
        let m = grid.count, n = grid[0].count
        return (0..<n).map {
            var row = 0, col = $0
            while row < m {
                let direction = grid[row][col],
                next = col + direction
                guard next >= 0 && next < n && direction == grid[row][next] else {
                    break
                }
                row += 1
                col = next
            }
            return row == m ? col : -1
        }
    }
}