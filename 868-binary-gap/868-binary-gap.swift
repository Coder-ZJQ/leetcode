class Solution {
    func binaryGap(_ n: Int) -> Int {
        var n = n,
            index = 0,
            res = 0,
            pre: Int?
        while n > 0 {
            if n & 1 == 1 {
                if let pre = pre {
                    res = max(res, index - pre)
                }
                pre = index
            }
            index += 1
            n >>= 1
        }
        return res
    }
}
