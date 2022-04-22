class Solution {
    func minSteps(_ s: String, _ t: String) -> Int {
        var counts = [Character: Int]()
        for c in s {
            counts[c] = counts[c, default: 0] + 1
        }
        for c in t {
            counts[c] = counts[c, default: 0] - 1
        }
        return counts.values.map(abs).reduce(0, +) / 2
    }
}