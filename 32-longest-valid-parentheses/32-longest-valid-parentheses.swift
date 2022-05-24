class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var res = 0, stack = [-1]
        for (i, c) in s.enumerated() {
            if c == "(" {
                stack.append(i)
            } else {
                stack.popLast()
                if stack.isEmpty {
                    stack.append(i)
                } else {
                    res = max(res, i - stack.last!)
                }
            }
        }
        return res
    }
}
