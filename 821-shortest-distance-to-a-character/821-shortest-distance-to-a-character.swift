class Solution {
    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        let chars = [Character](s)
        // right to left
        var l2r = [Int](repeating: chars.count, count: chars.count)
        // left to right
        var r2l = [Int](repeating: chars.count, count: chars.count)
        
        var index = 0
        let start = chars.firstIndex(of: c)!
        for i in start..<chars.count {
            if chars[i] == c {
                index = i
            }
            l2r[i] = i - index
        }
        
        let end = chars.lastIndex(of: c)!
        for i in (0...end).reversed() {
            if chars[i] == c {
                index = i
            }
            r2l[i] = index - i
        }
        
        return zip(l2r, r2l).map {
            min($0, $1)
        }
    }
}