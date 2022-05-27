class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var num = num, res = 0
        while num > 0 {
            if num % 2 == 1 {
                num -= 1
            } else {
                num >>= 1
            }
            res += 1
        }
        return res
    }
}
