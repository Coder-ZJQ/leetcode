
class NumMatrix {

    private var sumMatrix: [[Int]]
    
    init(_ matrix: [[Int]]) {
        sumMatrix = matrix
        let m = matrix.count, n = matrix[0].count
        for r in 0..<m {
            for c in 1..<n {
                sumMatrix[r][c] += sumMatrix[r][c - 1]
            }
        }
        for r in 1..<m {
            for c in 0..<n {
                sumMatrix[r][c] += sumMatrix[r - 1][c]
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var sum = sumMatrix[row2][col2]
        if row1 > 0 {
            sum -= sumMatrix[row1 - 1][col2]
        }
        if col1 > 0 {
            sum -= sumMatrix[row2][col1 - 1]
        }
        if row1 > 0 && col1 > 0 {
            sum += sumMatrix[row1 - 1][col1 - 1]
        }
        return sum
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */