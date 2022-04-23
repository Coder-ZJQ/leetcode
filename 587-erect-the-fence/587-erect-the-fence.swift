class Solution {
    
    struct Point: Hashable, Comparable {
        static func < (lhs: Point, rhs: Point) -> Bool {
            if lhs.x == rhs.x {
                return lhs.y < rhs.y
            }
            return lhs.x < rhs.x
        }
        
        var x: Int
        var y: Int
    }
        
    private func getRotationAngle(_ point1: Point, _ point2: Point, _ point3: Point) -> Int {
        
        ///            x3y3
        ///             /
        ///            /
        /// x1y1 --- x2y2
        ///
        /// ∵ (y3 - y2) / (x3 - x2) - (y2 - y1) / (x2 - x1) > 0
        ///   [(y3 - y2)(x2 - x1) - (y2 - y1)(x3 - x2)] / [(x3 - x2)(x2 - x1)] > 0
        ///
        /// ∵ (x3 - x2)(x2 - x1) > 0
        ///
        /// ∴ (y3 - y2)(x2 - x1) - (y2 - y1)(x3 - x2) > 0
        ///   (y3 - y2)(x2 - x1) > (y2 - y1)(x3 - x2)
        ///
        
        (point3.y - point2.y) * (point2.x - point1.x) - (point2.y - point1.y) * (point3.x - point2.x)
    }
    
    
    func outerTrees(_ trees: [[Int]]) -> [[Int]] {
        let n = trees.count
        guard n > 3 else { return trees }
        
        let points = trees.map {
            Point(x: $0[0], y: $0[1])
        }.sorted()
        
        var lower = [Point](),
            upper = [Point]()
        
        for point in points {
            while lower.count >= 2 && getRotationAngle(lower[lower.count - 2], lower[lower.count - 1], point) > 0 {
                lower.removeLast()
            }
            while upper.count >= 2 && getRotationAngle(upper[upper.count - 2], upper[upper.count - 1], point) < 0 {
                upper.removeLast()
            }
            lower.append(point)
            upper.append(point)
        }
        
        return Set(lower + upper).map { point in
            [point.x, point.y]
        }
    }
}
