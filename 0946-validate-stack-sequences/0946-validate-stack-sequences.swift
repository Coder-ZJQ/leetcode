class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var stack = [Int](), i = 0
        for pop in popped {
            if let last = stack.last, pop == last {
                stack.removeLast()
                continue
            }
            while i < pushed.count && pushed[i] != pop {
                stack.append(pushed[i])
                i += 1
            }
            i += 1
        }
        return stack.isEmpty
    }
}