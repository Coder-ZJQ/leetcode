class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else { return 0 }
        var f0 = -prices[0],
            f1 = 0,
            f2 = 0
        
        for price in prices[1...] {
            (f0, f1, f2) = (max(f0, f2 - price), f0 + price, max(f1, f2))
        }
        
        return max(f1, f2)
    }
}
