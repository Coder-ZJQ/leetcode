class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        let intervals = intervals.sorted {
            if $0[0] < $1[0] {
                return true
            }
            if $0[0] == $1[0] {
                return $0[1] > $1[1]
            }
            return false
        }
        var pre = intervals[0][1],
            res = intervals.count
        for interval in intervals[1...] {
            if interval[1] <= pre {
                res -= 1
            } else {
                pre = interval[1]
            }
        }
        
        return res
    }
}