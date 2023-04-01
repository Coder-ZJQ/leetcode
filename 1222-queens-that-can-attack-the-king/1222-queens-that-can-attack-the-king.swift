class Solution {
    func queensAttacktheKing(_ queens: [[Int]], _ king: [Int]) -> [[Int]] {
        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0), (1, 1), (-1, -1), (-1, 1), (1, -1)]
        var set = Set<String>()
        for queen in queens {
            set.insert("\(queen[0]),\(queen[1])")
        }
        var res = [[Int]]()
        for (v, h) in directions {
            var x = king[0], y = king[1]
            while x >= 0 && y >= 0 && x < 8 && y < 8 {
                if set.contains("\(x),\(y)") {
                    res.append([x, y])
                    break
                }
                x += v
                y += h
            }
        }
        return res
    }
}
