class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        // 买卖这只股票的花费
        var cost = prices[0] + fee
        // 收益
        var profit = 0
        for price in prices[1...] {
            print(cost)
            let cur = price + fee
            if cur < cost {
                // 当前花费少则换成此时买入
                cost = cur
            } else if price > cost {
                // 当前价格比花费多时累加收益
                profit += price - cost
                cost = price
            }
        }
        return profit
    }
}