class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var set = Set<String>()
        for row in 0..<9 {
            for col in 0..<9 {
                let num = board[row][col]
                guard num != "." else { continue }
                if !set.insert("\(num),r\(row)").inserted ||
                    !set.insert("\(num),c\(col)").inserted ||
                    !set.insert("\(num),\(row / 3)-\(col / 3)").inserted {
                    return false
                }
            }
        }
        return true
    }
}
