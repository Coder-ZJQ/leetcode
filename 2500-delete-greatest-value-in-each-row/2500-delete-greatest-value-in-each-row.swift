class Solution {
    func deleteGreatestValue(_ grid: [[Int]]) -> Int {
        let grid = grid.map {
            $0.sorted()
        }
        let m = grid.count, n = grid[0].count
        return (0..<n).reduce(0) { partialResult, col in
            var maxVal = Int.min
            for row in 0..<m {
                maxVal = max(maxVal, grid[row][col])
            }
            return partialResult + maxVal
        }
    }
}
