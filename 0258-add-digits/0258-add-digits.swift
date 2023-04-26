class Solution {
    func addDigits(_ num: Int) -> Int {
        var res = num
        while res >= 10 {
            var num = res, sum = 0
            while num > 0 {
                sum += num % 10
                num /= 10
            }
            res = sum
        }
        return res
    }
}
