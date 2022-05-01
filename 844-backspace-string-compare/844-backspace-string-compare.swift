class Solution {
    private func afterBackspace(_ s: String) -> String {
        var stack = [Character]()
        for c in s {
            if c == "#" {
                stack.popLast()
            } else {
                stack.append(c)
            }
        }
        return String(stack)
    }
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        afterBackspace(s) == afterBackspace(t)
    }
}
