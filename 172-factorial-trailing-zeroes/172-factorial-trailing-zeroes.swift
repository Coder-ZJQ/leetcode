class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        n == 0 ? 0 : n / 5 + trailingZeroes(n / 5)
    }
}