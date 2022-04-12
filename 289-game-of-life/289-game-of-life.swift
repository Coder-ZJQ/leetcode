class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        let m = board.count, n = board[0].count
        for row in 0..<m {
            for col in 0..<n {
                var live = 0
                for i in -1...1 {
                    for j in -1...1 {
                        if i == 0 && j == 0 {
                            continue
                        }
                        let nRow = row + i, nCol = col + j
                        if nRow >= 0 && nRow < m && nCol >= 0 && nCol < n && (board[nRow][nCol] == 1 || board[nRow][nCol] == -1) {
                            live += 1
                        }
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
