class Solution {
    func scoreOfParentheses(_ s: String) -> Int {
        var stack = [Int]()
        for c in s {
            if c == "(" {
                stack.append(0)
            } else {
                let last = stack.removeLast()
                if last == 0 {
                    stack.append(1)
                } else {
                    stack.removeLast()
                    stack.append(last * 2)
                }
                var sum = 0
                while let l = stack.last, l > 0 {
                    sum += stack.removeLast()
                }
                if sum > 0 {
                    stack.append(sum)
                }
            }
        }
        return stack.last ?? 0
    }
}