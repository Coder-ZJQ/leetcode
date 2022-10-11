class Solution {
    func findArray(_ pref: [Int]) -> [Int] {
        var res = pref
        for i in 1..<pref.count {
            // x ^ pref[i - 1] = pref[i]
            // x = pref[i - 1] ^ pref[i]
            res[i] = pref[i] ^ pref[i - 1]
        }
        return res
    }
}
