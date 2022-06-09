class Solution {

    /// 点的数量前缀和
    private var pointSums: [Int]
    private let rects: [[Int]]
    
    init(_ rects: [[Int]]) {
        self.rects = rects
        let n = rects.count
        pointSums = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
            // 当前矩形点前缀和
            pointSums[i] =
            // 前一个矩形点前缀和
            pointSums[i - 1] +
            // 当前矩形点数量
            (rects[i - 1][2] - rects[i - 1][0] + 1) * (rects[i - 1][3] - rects[i - 1][1] + 1)
        }
    }
    
    func pick() -> [Int] {
        // 总共的点数量
        let total = pointSums.last!
        // 随机一个点的索引
        let randomPoint = Int.random(in: 1...total)
        // 二分查找该点在哪个矩形
        var left = 0, right = pointSums.count - 1
        while left < right {
            let mid = left + (right - left) >> 1
            if pointSums[mid] >= randomPoint {
                right = mid
            } else {
                left = mid + 1
            }
        }
        let rect = rects[left - 1],
            x = Int.random(in: rect[0]...rect[2]),
            y = Int.random(in: rect[1]...rect[3])
        return [x, y]
    }
}
/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(rects)
 * let ret_1: [Int] = obj.pick()
 */