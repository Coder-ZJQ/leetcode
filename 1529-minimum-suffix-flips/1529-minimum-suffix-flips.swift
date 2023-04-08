class Solution {
    func minFlips(_ target: String) -> Int {
        var res = 0, pre: Character = "0"
        for char in target {
            if char != pre {
                res += 1
                pre = char
            }
        }
        return res
    }
}
