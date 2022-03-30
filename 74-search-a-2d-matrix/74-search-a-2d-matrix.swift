class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count, n = matrix[0].count
        var left = 0, right = m * n - 1
        while left < right {
            let mid = left + (right - left) >> 1
            let row = mid / n,
            col = mid % n,
            value = matrix[row][col]
            if value < target {
                left = mid + 1
            } else if value == target {
                return true
            } else {
                right = mid
            }
        }
        return matrix[left / n][left % n] == target
    }
}
