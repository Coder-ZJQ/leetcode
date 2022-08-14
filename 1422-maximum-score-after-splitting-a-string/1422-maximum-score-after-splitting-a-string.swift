class Solution {
    func maxScore(_ s: String) -> Int {
        let n = s.count
        var zeroCount = [Int](repeating: 0, count: n),
            oneCount = zeroCount
        var zero = 0
        for (i, c) in s.enumerated() {
            if c == "0" {
                zero += 1
            }
            zeroCount[i] = zero
        }
        var one = 0
        for (i, c) in s.reversed().enumerated() {
            if c == "1" {
                one += 1
            }
            oneCount[n - 1 - i] = one
        }
        var res = 0
        for i in 0..<(n-1) {
            res = max(res, zeroCount[i] + oneCount[i + 1])
        }
        return res
    }
}