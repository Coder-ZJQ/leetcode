class Solution {
    func matrixScore(_ grid: [[Int]]) -> Int {
        var grid = grid
        let m = grid.count,
            n = grid[0].count
        for i in 0..<m where grid[i][0] == 0 {
            for j in 0..<n {
                grid[i][j] = grid[i][j] == 0 ? 1 : 0
            }
        }
        for i in 0..<n {
            var zeroCount = 0
            for j in 0..<m where grid[j][i] == 0 {
                zeroCount += 1
            }
            guard zeroCount > m - zeroCount else { continue }
            for j in 0..<m {
                grid[j][i] = grid[j][i] == 0 ? 1 : 0
            }
        }
        return grid.reduce(0) { partialResult, next in
            partialResult + next.enumerated().reduce(0) { partialResult, next in
                partialResult + (1 << (n - 1 - next.offset) * next.element)
            }
        }
    }
}