class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        let n = s.count
        guard n >= k else { return false }
        let chars = [Character](s)
        var codeSet = Set<String>()
        for i in 0...n - k {
            let start = i, end = i + k
            codeSet.insert(String(chars[start..<end]))
        }
        return codeSet.count == (1 << k)
    }
}