class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        let m = board.count, n = board[0].count,
        neighbors = [(1, 1), (-1, 1), (1, -1), (-1, -1), (1, 0), (0, 1), (-1, 0), (0, -1)]
        for row in 0..<m {
            for col in 0..<n {
                var live = 0
                for (x, y) in neighbors {
                    let nRow = row + x, nCol = col + y
                    if nRow >= 0 && nRow < m && nCol >= 0 && nCol < n && (board[nRow][nCol] == 1 || board[nRow][nCol] == -1) {
                        live += 1
                    }
                }
                if board[row][col] == 0 && live == 3 {
                    board[row][col] = 2
                } else if board[row][col] == 1 && (live > 3 || live < 2) {
                    board[row][col] = -1
                }
            }
        }
        for row in 0..<m {
            for col in 0..<n {
                let cell = board[row][col]
                if cell == -1 {
                    board[row][col] = 0
                } else if cell == 2 {
                    board[row][col] = 1
                }
            }
        }
    }
}
