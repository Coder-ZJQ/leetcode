class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var top = 0, bottom = n - 1
        var left = 0, right = n - 1
        var num = 1
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        while true {
            // -->
            for i in left...right {
                res[top][i] = num
                num += 1
            }
            top += 1
            if left > right || top > bottom { break }
            
            // ↓
            for i in top...bottom {
                res[i][right] = num
                num += 1
            }
            right -= 1
            if left > right || top > bottom { break }
            
            // <--
            var i = right
            while i >= left {
                res[bottom][i] = num
                num += 1
                i -= 1
            }
            bottom -= 1
            if left > right || top > bottom { break }
            
            // ↑
            i = bottom
            while i >= top {
                res[i][left] = num
                num += 1
                i -= 1
            }
            left += 1
            if left > right || top > bottom { break }
            
        }
        return res
    }
}
