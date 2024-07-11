class Solution {
    func reverseParentheses(_ s: String) -> String {
        var stack = [Character]()
        for c in s {
            if c == ")" {
                var temp = [Character]()
                while let last = stack.popLast() {
                    if last == "(" {
                        break
                    }
                    temp.append(last)
                }
                stack.append(contentsOf: temp)
            } else {
                stack.append(c)
            }
        }
        return String(stack)
    }
}