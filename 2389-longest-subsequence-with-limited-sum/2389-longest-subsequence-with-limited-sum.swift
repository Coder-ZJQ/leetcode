class Solution {
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        var prefixSum = nums.sorted()
        let n = prefixSum.count
        for i in 1..<n {
            prefixSum[i] += prefixSum[i - 1]
        }
        return queries.map { query in
            var l = 0, r = n - 1
            while l <= r {
                let mid = l + (r - l) >> 1
                if prefixSum[mid] > query {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            return l
        }
    }
}