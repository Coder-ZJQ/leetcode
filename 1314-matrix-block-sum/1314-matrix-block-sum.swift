class Solution {
    func matrixBlockSum(_ mat: [[Int]], _ k: Int) -> [[Int]] {
        let m = mat.count, n = mat[0].count
        var sums = mat
        for r in 0..<m {
            for c in 1..<n {
                sums[r][c] += sums[r][c - 1]
            }
        }
        for r in 1..<m {
            for c in 0..<n {
                sums[r][c] += sums[r - 1][c]
            }
        }
        
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        for r in 0..<m {
            for c in 0..<n {
                let r0 = max(0, r - k),
                    c0 = max(0, c - k),
                    r1 = min(m - 1, r + k),
                    c1 = min(n - 1, c + k)
                var sum = sums[r1][c1]
                if r0 > 0 {
                    sum -= sums[r0 - 1][c1]
                }
                if c0 > 0 {
                    sum -= sums[r1][c0 - 1]
                }
                if c0 > 0 && r0 > 0 {
                    sum += sums[r0 - 1][c0 - 1]
                }
                
                res[r][c] = sum
            }
        }
        
        return res
        
    }
}