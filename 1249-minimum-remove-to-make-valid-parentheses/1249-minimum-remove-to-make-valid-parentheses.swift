class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack = [Int]()
        var removes = [Int]()
        for (i, c) in s.enumerated() {
            if c == "(" {
                stack.append(i)
            } else if c == ")" {
                if stack.isEmpty {
                    removes.append(i)
                } else {
                    stack.removeLast()
                }
            }
        }
        removes += stack
        var char = [Character](s)
        for r in removes.reversed() {
            char.remove(at: r)
        }
        return String(char)
    }
}
