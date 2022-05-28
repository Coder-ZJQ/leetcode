class Solution {
    func removeOuterParentheses(_ s: String) -> String {
        var stack = [Int](), res = ""
        for (i, c) in s.enumerated() {
            // 当为左括号时入栈
            if c == "(" {
                stack.append(i)
            } else {
                // 右括号时出栈，并获得左括号索引
                let left = stack.removeLast()
                // 当栈为空时既是最外层，并排除紧挨着的情况
                if stack.isEmpty && i - left > 1{
                    // 不包括最外层左括号的起始索引
                    let startIndex = s.index(after: s.index(s.startIndex, offsetBy: left))
                    // 不包括最外层右括号的结束索引
                    let endIndex = s.index(before: s.index(s.startIndex, offsetBy: i))
                    // 追加子字符串
                    res += s[startIndex...endIndex]
                }
            }
        }
        return res
    }
}