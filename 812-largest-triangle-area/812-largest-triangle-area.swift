class Solution {
    func largestTriangleArea(_ points: [[Int]]) -> Double {
        var area = 0.0
        for i in points {
            for j in points {
                for k in points {
                    area = max(area, 0.5 * Double(abs(i[0] * j[1] + j[0] * k[1] + k[0] * i[1] - j[0] * i[1] - k[0] * j[1] - i[0] * k[1])))
                }
            }
        }
        return area
    }
}