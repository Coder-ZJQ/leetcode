class Solution {
    func longestPalindrome(_ s: String) -> String {
        let n = s.count
        guard n > 1 else { return s }
        let chars = [Character](s)
        var start = 0, length = 0
        for i in 0..<n {
            // 回文字符串长度为奇数时中点左右指针
            var left = i, right = i
            // 左右指针向两边扩散
            while left >= 0 && right < n && chars[left] == chars[right] {
                left -= 1
                right += 1
            }
            // 计算长度
            var l = right - left - 1
            // 如果长度比之前的大
            if length < l {
                // 更新其实指针
                start = left + 1
                // 更新长度
                length = l
            }
            
            // 回文字符串长度为奇数时中点左右指针
            left = i
            right = i + 1
            while left >= 0 && right < n && chars[left] == chars[right] {
                left -= 1
                right += 1
            }
            l = right - left - 1
            if length < l {
                start = left + 1
                length = l
            }
        }
        return String(chars[start..<(start + length)])
    }
}
