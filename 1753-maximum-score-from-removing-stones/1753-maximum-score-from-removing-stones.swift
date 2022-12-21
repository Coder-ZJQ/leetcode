class Solution {
    func maximumScore(_ a: Int, _ b: Int, _ c: Int) -> Int {
        let sorted = [a, b, c].sorted()
        if sorted[0] + sorted[1] <= sorted[2] {
            return sorted[0] + sorted[1]
        } else {
            return sorted.reduce(0, +) / 2
        }
    }
}