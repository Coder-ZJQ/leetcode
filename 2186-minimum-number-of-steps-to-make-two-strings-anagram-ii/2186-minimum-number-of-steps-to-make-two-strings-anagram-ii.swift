class Solution {
    func minSteps(_ s: String, _ t: String) -> Int {
        var counts = [Int](repeating: 0, count: 26)
        for char in s {
            let index = Int(char.asciiValue!) - 97
            counts[index] += 1
        }
        for char in t {
            let index = Int(char.asciiValue!) - 97
            counts[index] -= 1
        }
        return counts.map {
            abs($0)
        }.reduce(0, +)
    }
}
