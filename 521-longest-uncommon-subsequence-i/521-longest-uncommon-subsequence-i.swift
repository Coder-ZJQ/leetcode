class Solution {
    func findLUSlength(_ a: String, _ b: String) -> Int {
        guard a != b else { return -1 }
        return max(a.count, b.count)
    }
}