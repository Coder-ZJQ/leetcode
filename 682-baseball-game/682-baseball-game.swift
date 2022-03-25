class Solution {
    func calPoints(_ ops: [String]) -> Int {
        var stack = [Int]()
        for op in ops {
            if op == "C" {
                stack.removeLast()
            } else if op == "D" {
                stack.append(stack.last! * 2)
            } else if op == "+" {
                let n = stack.count
                stack.append(stack[n - 1] + stack[n - 2])
            } else {
                stack.append(Int(op) ?? 0)
            }
        }
        return stack.reduce(0, +)
    }
}
