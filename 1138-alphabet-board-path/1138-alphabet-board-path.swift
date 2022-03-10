class Solution {
    func alphabetBoardPath(_ target: String) -> String {
        let board = ["abcde", "fghij", "klmno", "pqrst", "uvwxy", "z"]
        var map = [Character: (Int, Int)]()
        for (row, string) in board.enumerated() {
            for (col, char) in string.enumerated() {
                map[char] = (row, col)
            }
        }
        var res = "",
            pre: Character = "a"
        for char in target {
            if pre != char {
                let prePos = map[pre]!,
                    curPos = map[char]!,
                    vertical = curPos.0 - prePos.0,
                    horizon = curPos.1 - prePos.1
                if char == "z" {
                    res += String([Character](repeating: horizon > 0 ? "R" : "L", count: abs(horizon)))
                    res += String([Character](repeating: vertical > 0 ? "D" : "U", count: abs(vertical)))
                } else {
                    res += String([Character](repeating: vertical > 0 ? "D" : "U", count: abs(vertical)))
                    res += String([Character](repeating: horizon > 0 ? "R" : "L", count: abs(horizon)))
                }
                
            }
            res += "!"
            pre = char
        }
        return res
    }
}
