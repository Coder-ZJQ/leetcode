class Solution {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        var res = 0
        // f(n, k) = (f(n - 1, k) + k) % n
        for i in 1...n {
            res = (k + res - 1) % i + 1
        }
        return res
    }
}
