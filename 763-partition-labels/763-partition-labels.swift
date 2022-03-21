class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        var indexes = [Character: [Int]]()
        for (i, c) in s.enumerated() {
            indexes[c] = indexes[c,default: []] + [i]
        }
        var res = [Int](),
        left = 0,
        right = 0
        for (i, c) in s.enumerated() {
            right = max(right, indexes[c]!.last!)
            if i == right {
                res.append(right - left + 1)
                left = i + 1
                right = left
            }
        }
        return res
    }
}
