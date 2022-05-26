class Solution {
    func hammingWeight(_ n: Int) -> Int {
//        n.nonzeroBitCount
        var n = n, res = 0
        while n > 0 {
            if n & 1 == 1 {
                res += 1
            }
            n >>= 1
        }
        return res
    }
}
