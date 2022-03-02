class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var t = t
        for c in s {
            if let index = t.firstIndex(of: c) {
                t = String(t[t.index(after: index)...])
            } else {
                return false
            }
        }
        return true
    }
}