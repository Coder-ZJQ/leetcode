class Solution {
    func calPoints(_ ops: [String]) -> Int {
        var points = [Int](),
        res = 0
        for op in ops {
            var point = 0
            if op == "C" {
                res -= points.removeLast()
                continue
            } else if op == "D" {
                point = points.last! * 2
            } else if op == "+" {
                let n = points.count
                point = points[n - 1] + points[n - 2]
            } else {
                point = Int(op)!
            }
            res += point
            points.append(point)
        }
        return res
    }
}
