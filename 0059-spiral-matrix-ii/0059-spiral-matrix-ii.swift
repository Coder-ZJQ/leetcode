class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var left = 0, right = n - 1,
            top = 0, bottom = n - 1,
            num = 1
        var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        while true {
            
            // 从左向右
            for i in left...right {
                res[top][i] = num
                num += 1
            }
            top += 1
            guard left <= right && top <= bottom else { break }
            
            // 从山向下
            for i in top...bottom {
                res[i][right] = num
                num += 1
            }
            right -= 1
            guard left <= right && top <= bottom else { break }
            
            // 从右到左
            for i in (left...right).reversed() {
                res[bottom][i] = num
                num += 1
            }
            bottom -= 1
            guard left <= right && top <= bottom else { break }
            
            // 从下向上
            for i in (top...bottom).reversed() {
                res[i][left] = num
                num += 1
            }
            left += 1
            guard left <= right && top <= bottom else { break }
        }
        
        return res
    }
}
