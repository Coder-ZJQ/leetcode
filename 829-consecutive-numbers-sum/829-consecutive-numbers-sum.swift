class Solution {
    func consecutiveNumbersSum(_ n: Int) -> Int {
        var res = 1, i = 1
        while n - (1 + i) * i / 2 - (i + 1) >= 0 {
            if (n - (1 + i) * i / 2) % (i + 1) == 0 {
                res += 1
            }
            i += 1
        }
        return res
    }
}