class Solution {
    func countAsterisks(_ s: String) -> Int {
        var res = 0
        var shouldCount = true
        for c in s {
            if c == "|" {
                shouldCount.toggle()
            } else if shouldCount && c == "*" {
                res += 1
            }
        }
        return res
    }
}
