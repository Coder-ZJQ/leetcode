class Solution {
    
    private var queens = [Int]()
    private var colSet = Set<Int>()
    private var diagonals1Set = Set<Int>()
    private var diagonals2Set = Set<Int>()
    private var n = 0
    private var res = [[String]]()
    
    private func bt(_ row: Int) {
        if row == n {
            let strings = queens.map { index -> String in
                var chars = [Character](repeating: ".", count: n)
                chars[index] = "Q"
                return String(chars)
            }
            res.append(strings)
        } else {
            for i in 0..<n {
                if colSet.contains(i) {
                    continue
                }
                let diagonals1 = row - i
                if diagonals1Set.contains(diagonals1) {
                    continue
                }
                let diagonals2 = row + i
                if diagonals2Set.contains(diagonals2) {
                    continue
                }
                queens[row] = i
                colSet.insert(i)
                diagonals1Set.insert(diagonals1)
                diagonals2Set.insert(diagonals2)
                bt(row + 1)
                queens[row] = -1
                colSet.remove(i)
                diagonals1Set.remove(diagonals1)
                diagonals2Set.remove(diagonals2)
            }
        }
    }
    
    func solveNQueens(_ n: Int) -> [[String]] {
        queens = [Int](repeating: -1, count: n)
        self.n = n
        bt(0)
        return res
    }
}
