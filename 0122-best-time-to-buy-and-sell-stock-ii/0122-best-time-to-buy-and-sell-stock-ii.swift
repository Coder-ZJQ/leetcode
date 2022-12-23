class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        guard n > 1 else { return 0 }
        var res = 0
        // 累加所有上升
        for i in 1..<n where prices[i] > prices[i - 1] {
            res += (prices[i] - prices[i - 1])
        }
        return res
    }
}