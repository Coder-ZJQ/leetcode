class Solution {
    func numberOfCuts(_ n: Int) -> Int {
        n == 1 ? 0 : (n % 2 == 0 ? n / 2 : n)
    }
}
