class Solution {
    func modifiedMatrix(_ matrix: [[Int]]) -> [[Int]] {
        guard !matrix.isEmpty && !matrix[0].isEmpty else {
            return []
        }
        let m = matrix.count, n = matrix[0].count
        var matrix = matrix
        for i in 0..<n {
            var maxNum = Int.min
            var modifyIndex = [Int]()
            for j in 0..<m {
                if matrix[j][i] == -1 {
                    modifyIndex.append(j)
                } else {
                    maxNum = max(maxNum, matrix[j][i])
                }
            }
            for index in modifyIndex {
                matrix[index][i] = maxNum
            }
        }
        return matrix
    }
}