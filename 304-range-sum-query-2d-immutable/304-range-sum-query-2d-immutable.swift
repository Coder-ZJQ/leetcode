
class NumMatrix {
    
    private var sums: [[Int]]

    init(_ matrix: [[Int]]) {
        let m = matrix.count, n = matrix[0].count
        sums = matrix
        for i in 1..<m {
            sums[i][0] += sums[i - 1][0]
        }
        for i in 1..<n {
            sums[0][i] += sums[0][i - 1]
        }
        
        for i in 1..<m {
            for j in 1..<n {
                sums[i][j] += sums[i - 1][j] + sums[i][j - 1] - sums[i - 1][j - 1]
            }
        }
        
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var sum = sums[row2][col2]
        if row1 > 0 {
            sum -= sums[row1 - 1][col2]
        }
        if col1 > 0 {
            sum -= sums[row2][col1 - 1]
        }
        if row1 > 0 && col1 > 0 {
            sum += sums[row1 - 1][col1 - 1]
        }
        return sum
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */