class Solution {
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        guard startTime.count == endTime.count && endTime.count == profit.count else { return 0 }
        let jobs = startTime.enumerated().map {
            ($0.element, endTime[$0.offset], profit[$0.offset])
        }.sorted {
            $0.1 < $1.1
        }
        let n = jobs.count
        var dp = [Int](repeating: 0, count: n + 1)
        for i in 1...n {
            var left = 0, right = i
            let target = jobs[i - 1].0
            while left < right {
                let mid = left + (right - left) / 2
                if jobs[mid].1 > target {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            dp[i] = max(dp[i - 1], dp[left] + jobs[i - 1].2)
        }
        return dp[n]
    }
}
