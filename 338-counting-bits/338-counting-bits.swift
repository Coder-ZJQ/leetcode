class Solution {
    func countBits(_ n: Int) -> [Int] {
        var result = [Int](repeating: 0, count: n + 1)
        for i in 0...n {
            result[i] = result[i / 2] + i % 2
        }
        return result
    }
}
