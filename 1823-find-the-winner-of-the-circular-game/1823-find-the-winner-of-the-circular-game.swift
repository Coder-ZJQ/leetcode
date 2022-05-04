class Solution {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        guard n > 1 else { return 1 }
        var res = 1
        for i in 2...n {
            res = (k + res - 1) % i + 1
        }
        return res
    }
}
