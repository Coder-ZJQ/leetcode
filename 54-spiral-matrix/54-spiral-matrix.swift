class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let n = matrix.count, m = matrix[0].count
        var top = 0, bottom = n - 1
        var left = 0, right = m - 1
        var res = [Int]()
        while true {
            // -->
            for i in left...right {
                res.append(matrix[top][i])
            }
            top += 1
            if left > right || top > bottom { break }
            
            // ↓
            for i in top...bottom {
                res.append(matrix[i][right])
            }
            right -= 1
            if left > right || top > bottom { break }
            
            // <--
            var i = right
            while i >= left {
                res.append(matrix[bottom][i])
                i -= 1
            }
            bottom -= 1
            if left > right || top > bottom { break }
            
            // ↑
            i = bottom
            while i >= top {
                res.append(matrix[i][left])
                i -= 1
            }
            left += 1
            if left > right || top > bottom { break }
            
        }
        return res
    }
}