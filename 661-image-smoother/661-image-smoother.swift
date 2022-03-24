class Solution {
    func imageSmoother(_ img: [[Int]]) -> [[Int]] {
        let m = img.count, n = img[0].count
        var res = [[Int]]()
        for i in 0..<m {
            var arr = [Int]()
            for j in 0..<n {
                var cnt = 0, sum = 0
                for a in -1...1 {
                    for b in -1...1 {
                        let row = i + a, col = j + b
                        if row >= 0 && row < m && col >= 0 && col < n {
                            sum += img[row][col]
                            cnt += 1
                        }
                    }
                }
                arr.append(sum / cnt)
            }
            res.append(arr)
        }
        return res
    }
}
