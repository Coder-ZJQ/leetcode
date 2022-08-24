class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        // 32 位中 3 的幂最大为 1162261467
        n > 0 && 1162261467 % n == 0
    }
}