class Solution {
    func countOrders(_ n: Int) -> Int {
        let mod = Int(1e9 + 7)
        var res = 1
        for i in 1...n {
            res *= (i * (2 * i - 1))
            res %= mod
        }
        return res
    }
}