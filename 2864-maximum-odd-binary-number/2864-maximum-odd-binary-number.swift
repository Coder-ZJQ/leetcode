class Solution {
    func maximumOddBinaryNumber(_ s: String) -> String {
        var res: String = ""
        for c in s {
            if c == "0" {
                res += "0"
            } else {
                res = "1" + res
            }
        }
        return res[res.index(after: res.startIndex)...] + "1"
    }
}