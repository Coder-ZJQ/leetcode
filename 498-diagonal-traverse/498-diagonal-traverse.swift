class Solution {
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        let m = mat.count, n = mat.first?.count ?? 0
        var res = [Int](repeating: 0, count: m * n)
        // 一共有 m + n - 1 条对角线
        let diagonalCount = m + n - 1
        var index = 0
        // 遍历这些对角线
        for i in 0..<diagonalCount {
            // 区分对角线方向
            
            if i % 2 == 0 { // ↗
                // 起始坐标
                var x = i < m ? i : m - 1,
                    y = i < m ? 0 : i - m + 1
                while x >= 0 && y < n {
                    res[index] = mat[x][y]
                    index += 1
                    x -= 1
                    y += 1
                }
            } else {        // ↙
                // 起始坐标
                var x = i < n ? 0 : i - n + 1,
                    y = i < n ? i : n - 1
                while x < m && y >= 0 {
                    res[index] = mat[x][y]
                    index += 1
                    x += 1
                    y -= 1
                }
            }
        }
        
        return res
    }
}
