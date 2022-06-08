class Solution {
    func removePalindromeSub(_ s: String) -> Int {
        // 只有两种情况:
        // 如果已经是回文字符串只需要一步;
        // 如果不是则需要两步：移走所有 a 再移走所有 b，或者反过来
        s == String(s.reversed()) ? 1 : 2
    }
}
