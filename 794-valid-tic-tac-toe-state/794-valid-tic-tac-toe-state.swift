class Solution {
    private func isWin(_ board: [[Character]], _ player: Character) -> Bool {
        for i in 0...2 {
            if (player == board[0][i] && board[0][i] == board[1][i] && board[1][i] == board[2][i]) ||
                (player == board[i][0] && board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
                return true
            }
        }
        return (player == board[0][0] && board[0][0] == board[1][1] && board[1][1] == board[2][2]) ||
                (player == board[0][2] && board[0][2] == board[1][1] && board[1][1] == board[2][0])
    }
    func validTicTacToe(_ board: [String]) -> Bool {
        let charBoard = board.map {
            [Character]($0)
        }
        var oCount = 0, xCount = 0
        for row in charBoard {
            for col in row {
                if col == "X" {
                    xCount += 1
                } else if col == "O" {
                    oCount += 1
                }
            }
        }
        // 当数量相同时，X 不可能已经赢了
        if xCount == oCount {
            return !isWin(charBoard, "X")
        }
        // 当 X 比 O 多一个时，O 不可能已经赢了
        if xCount - oCount == 1 {
            return !isWin(charBoard, "O")
        }
        return false
    }
}
