class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 else { return 0 }
        guard triangle.count > 1 else { return triangle[0][0] }
        var dp = triangle.last!
        let n = triangle.last!.count
        for i in (0...(n - 2)).reversed() {
            let cur = triangle[i]
            for j in 0..<cur.count {
                dp[j] = min(dp[j], dp[j + 1]) + cur[j];
            }
        }
        return dp[0]
    }
}