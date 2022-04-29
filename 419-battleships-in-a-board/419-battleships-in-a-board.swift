class Solution {
    
    func countBattleships(_ board: [[Character]]) -> Int {
        var board = board, res = 0
        let m = board.count, n = board[0].count
        for row in 0..<m {
            for col in 0..<n where board[row][col] == "X" {
                board[row][col] = "."
                
                var i = col + 1
                while i < n && board[row][i] == "X" {
                    board[row][i] = "."
                    i += 1
                }
                
                i = row + 1
                while i < m && board[i][col] == "X" {
                    board[i][col] = "."
                    i += 1
                }
                
                res += 1
            }
        }
        return res
    }
}
