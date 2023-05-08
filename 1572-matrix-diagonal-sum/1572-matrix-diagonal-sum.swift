class Solution {
    func diagonalSum(_ mat: [[Int]]) -> Int {
        let n = mat.count
        var res = 0
        for i in 0..<n {
            res += mat[i][i] + mat[n - 1 - i][i]
        }
        if n % 2 == 1 {
            res -= mat[n / 2][n / 2]
        }
        return res
    }
}
