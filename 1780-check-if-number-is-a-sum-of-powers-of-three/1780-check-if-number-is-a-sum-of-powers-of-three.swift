class Solution {
    /// 转换为 3 进制：
    /// 12: 110
    /// 21: 210
    /// 91: 10101
    /// 第 n 位数(0, 1, 2)分别表示：
    /// 0 表示没有 3^n，符合题目要求
    /// 1 表示有 3^n，符合题目要求
    /// 2 表示需要两个 3^n，与题目要求的不同三的次幂冲突
    func checkPowersOfThree(_ n: Int) -> Bool {
        var n = n
        while n > 0 {
            if n % 3 == 2 {
                return false
            }
            n /= 3
        }
        return true
    }
}
