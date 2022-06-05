class QueenPuzzle {
    
    private var n: Int
    private var queens: [Int]
    private var colSet = Set<Int>()
    private var diagonals1Set = Set<Int>()
    private var diagonals2Set = Set<Int>()
    
    private var res = 0
    
    init(_ n: Int) {
        self.n = n
        queens = [Int](repeating: -1, count: n)
    }
    
    private func bt(_ row: Int) {
        if row == n {
            res += 1
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
    
    func totalNQueens() -> Int {
        bt(0)
        return res
    }
}


class Solution {
    
    func totalNQueens(_ n: Int) -> Int {
        QueenPuzzle(n).totalNQueens()
    }
}
