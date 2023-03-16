class Solution {
    func countDigits(_ num: Int) -> Int {
        var number = num
        var res = 0
        while number > 0 {
            let digit = number % 10
            if num % digit == 0 {
                res += 1
            }
            number /= 10
        }
        return res
    }
}
