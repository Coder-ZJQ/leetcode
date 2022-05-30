class Solution {
    /// 除数与被除数都为正数
    private func dividePositive(_ dividend: Int, _ divisor: Int) -> Int {
        guard dividend >= divisor else {
            return 0
        }
        var count = 1
        var tempDivisor = divisor
        // 翻倍
        while (tempDivisor << 1) <= dividend {
            count <<= 1
            tempDivisor <<= 1
        }
        return count + dividePositive(dividend - tempDivisor, divisor)
    }
    
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if divisor == 1 {
            return dividend
        }
        // 被除数区间：[-2^32, 2^32 - 1]
        // 如果除数是 -1：[-2^32 + 1, 2^32]
        // 右区间可能会溢出（被除数等于 -2^32 时）
        if divisor == -1 {
            return dividend == Int32.min ? Int(Int32.max) : -dividend
        }
        // 是否都是整数或者都是负数
        let same = (dividend > 0 && divisor > 0) || (dividend < 0 && divisor < 0)
        // 全部取正数
        let dividend = abs(dividend), divisor = abs(divisor)
        let res = dividePositive(dividend, divisor)
        return same ? res : -res
    }
}
