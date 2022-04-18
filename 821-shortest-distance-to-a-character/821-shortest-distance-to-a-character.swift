class Solution {
    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        let chars = [Character](s)
        var res = [Int](repeating: chars.count, count: chars.count)
        
        var index = 0
        // left to right
        let start = chars.firstIndex(of: c)!
        for i in start..<chars.count {
            if chars[i] == c {
                index = i
            }
            res[i] = i - index
        }
        // right to left
        let end = chars.lastIndex(of: c)!
        for i in (0...end).reversed() {
            if chars[i] == c {
                index = i
            }
            res[i] = min(res[i], index - i)
        }
        return res
    }
}