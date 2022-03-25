class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        var res = costs.reduce(0) { partialResult, next in
            partialResult + next[0]
        }
        let sorted = costs.map {
            $0[1] - $0[0]
        }.sorted()
        let n = costs.count / 2
        res = sorted[0..<n].reduce(res) { partialResult, next in
            partialResult + next
        }
        return res
    }
}
