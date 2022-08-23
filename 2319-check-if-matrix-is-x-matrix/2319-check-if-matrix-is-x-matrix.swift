class Solution {
    func checkXMatrix(_ grid: [[Int]]) -> Bool {
        let n = grid.count
        for row in 0..<n {
            for col in 0..<n {
                let num = grid[row][col]
                if row == col || row + col == n - 1 {
                    if num == 0 {
                        return false
                    }
                } else {
                    if num != 0 {
                        return false
                    }
                }
            }
        }
        return true
    }
}
