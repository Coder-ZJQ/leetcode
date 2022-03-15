class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var chars = [Character](s)
        var stack = [Int]()
        for i in (0..<chars.count).reversed() {
            let char = chars[i]
            if char == ")" {
                stack.append(i)
            } else if char == "(" {
                if stack.isEmpty {
                    chars.remove(at: i)
                } else {
                    stack.removeLast()
                }
            }
        }
        for r in stack {
            chars.remove(at: r)
        }
        return String(chars)
    }
}
