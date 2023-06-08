class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        let n = grid[0].count
        return grid.reduce(0) { partialResult, next in
            let index = next.firstIndex {
                $0 < 0
            }
            return index == nil ? partialResult : partialResult + n - index!
        }
    }
}
