class Solution {
    func countNumbersWithUniqueDigits(_ n: Int) -> Int {
        /*
        0: 1
        1: 10
        2: 10 + 9 * 9 = 91
        3: 91 + 9 * 9 * 8 = 739
        4: 739 + 9 * 9 * 8 * 7 = 
        */
        var dp = [1, 10, 91]
        if n > 2 {
            var cur = 9 * 9
            for i in 3...n {
                cur *= (11 - i)
                dp.append(dp[i - 1] + cur)
            }
        } 
        return dp[n]
    }
}