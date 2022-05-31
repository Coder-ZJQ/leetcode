class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        let n = s.count
        guard n >= k else { return false }
        let chars = [Character](s)
        var codeSet = Set<String>()
        var subChars = chars[..<k]
        codeSet.insert(String(subChars))
        // 大小为 k 的滑动窗口
        for c in chars[k...] {
            subChars.removeFirst()
            subChars.append(c)
            codeSet.insert(String(subChars))
        }
        // 所有情况的数量需等于 2^k
        return codeSet.count == (1 << k)
    }
}