class Solution {
    func largestTriangleArea(_ points: [[Int]]) -> Double {
        var res: Double = 0.0
        for point1 in points {
            for point2 in points {
                for point3 in points {
                    let x = point1[0]
                    let y = point1[1]
                    
                    // 向量一
                    let v1x = point2[0] - x
                    let v1y = point2[1] - y
                    
                    // 向量二
                    let v2x = point3[0] - x
                    let v2y = point3[1] - y
                    
                    // 向量叉乘
                    let crossProduct = Double(abs(v1x * v2y - v2x * v1y)) / 2.0
                    res = max(res, crossProduct)
                }
            }
        }
        return res
    }
}
