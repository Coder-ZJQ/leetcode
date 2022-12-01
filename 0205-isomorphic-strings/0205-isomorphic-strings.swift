class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        
        var dictS2T = [Character: Character](), // 字符串 s 中字符与字符串 t 中字符建立映射
            dictT2S = [Character: Character]()  // 字符串 t 中字符与字符串 s 中字符建立映射
        for (charS, charT) in zip(s, t) {
            // 存在映射
            if let char = dictS2T[charS] {
                // 但是映射不成立
                if char != charT {
                    return false
                }
            } else if let _ = dictT2S[charT] {  // 已经存在另外的映射
                return false
            } else {
                // 建立映射
                dictS2T[charS] = charT
                dictT2S[charT] = charS
            }
        }
        return true
    }
}
