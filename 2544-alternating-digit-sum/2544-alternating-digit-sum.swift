class Solution {
    func alternateDigitSum(_ n: Int) -> Int {
        var num = n, sign = 1, res = 0
        while num > 0 {
            res += num % 10 * sign
            sign *= -1
            num /= 10
        }
        return -sign * res
    }
}