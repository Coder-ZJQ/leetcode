class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard k > 0 else {
            return [[]]
        }
        guard n != k else {
            return [Array(1...n)]
        }
        var result = combine(n - 1, k - 1)
        result = result.map({ $0 + [n] })
        result += combine(n - 1, k)
        return result
    }
}