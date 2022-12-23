class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        guard n > 1 else { return 0 }
        var res = 0, pre = prices.first!
        // 累加所有上升
        for price in prices[1...] {
            if price > pre {
                res += price - pre   
            }
            pre = price
        }
        return res
    }
}