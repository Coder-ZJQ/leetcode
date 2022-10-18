class Solution {
    func countAndSay(_ n: Int) -> String {
        // 1 的话直接返回 "1"
        guard n > 1 else { return "1" }
        let preRes = countAndSay(n - 1)
        var res: String = ""
        var preChar: Character = preRes.first!
        var count = 1
        for char in preRes[preRes.index(after: preRes.startIndex)...] {
            if char != preChar {
                res += "\(count)\(preChar)"
                count = 1
            } else {
                count += 1
            }
            preChar = char
        }
        res += "\(count)\(preChar)"
        return res
    }
}