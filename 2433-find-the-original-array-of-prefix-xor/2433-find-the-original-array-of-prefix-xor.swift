class Solution {
    func findArray(_ pref: [Int]) -> [Int] {
        let n = pref.count
        var res = [pref.first!]
        for i in 1..<n {
            res.append(pref[i] ^ pref[i - 1])
        }
        return res
    }
}
