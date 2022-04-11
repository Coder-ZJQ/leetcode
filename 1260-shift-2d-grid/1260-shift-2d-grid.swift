class Solution {
    func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        let m = grid.count, n = grid[0].count
        var k = k % (m * n)
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                let shifti = (i + (j + k) / n) % m
                let shiftj = (j + k) % n
                res[shifti][shiftj] = grid[i][j]
            }
        }
        
        return res
    }
}