class Solution {
    func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
        var indexes = [Character: Int]()
        var res = -1
        for (i, c) in s.enumerated() {
            if let pre = indexes[c] {
                res = max(res, i - pre - 1)
            } else {
                indexes[c] = i
            }
        }
        return res
    }
}
