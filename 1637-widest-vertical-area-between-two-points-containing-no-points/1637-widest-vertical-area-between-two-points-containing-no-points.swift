class Solution {
    func maxWidthOfVerticalArea(_ points: [[Int]]) -> Int {
        guard points.count > 0 else {
            return 0
        }
        let x = points.sorted(by: { $0[0] < $1[0] })
        var result = 0
        x.reduce(x[0]) { partialResult, next in
            let width = next[0] - partialResult[0]
            if width > result {
                result = width
            }
            return next
        }
        return result
    }
}