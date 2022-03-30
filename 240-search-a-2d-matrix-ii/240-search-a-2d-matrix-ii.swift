class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count, n = matrix[0].count
        var left = 0, right = n - 1
        while left < right {
            let mid = left + (right - left) >> 1
            if matrix[0][mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        let col = left
        left = 0
        right = m - 1
        while left < right {
            let mid = left + (right - left) >> 1
            if matrix[mid][0] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        let row = left
        for i in (0...row).reversed() {
            left = 0
            right = col
            while left < right {
                let mid = left + (right - left) >> 1
                if matrix[i][mid] < target {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            if matrix[i][left] == target {
                return true
            }
        }
        return false
    }
}
