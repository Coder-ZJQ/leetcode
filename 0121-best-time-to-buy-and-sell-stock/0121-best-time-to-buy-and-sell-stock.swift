class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxCur = 0
        var maxSoFar = 0
        for i in 1..<prices.count {
            maxCur += prices[i] - prices[i - 1]
            maxCur = max(0, maxCur)
            maxSoFar = max(maxCur, maxSoFar)
        }
        return maxSoFar
    }
}