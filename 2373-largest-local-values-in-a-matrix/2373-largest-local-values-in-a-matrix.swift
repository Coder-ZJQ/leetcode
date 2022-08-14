class Solution {
    func largestLocal(_ grid: [[Int]]) -> [[Int]] {
        let n = grid.count - 2
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        for i in 0..<n {
            for j in 0..<n {
                var num = Int.min
                for x in -1...1 {
                    for y in -1...1 {
                        num = max(num, grid[i + 1 + x][j + 1 + y])
                    }
                }
                res[i][j] = num
            }
        }
        return res
    }
}
