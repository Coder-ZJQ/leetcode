class Solution {
    func minimumSwap(_ s1: String, _ s2: String) -> Int {
        guard s1.count == s2.count else { return -1 }
        var array: [Character] = zip(s1, s2).filter {
            $0.0 != $0.1
        }.map(\.0)
        guard !array.isEmpty else { return 0 }
        
        var res = 0
        var stack = [Character]()
        for char in array {
            if let last = stack.last, last == char {
                stack.removeLast()
                res += 1
            } else {
                stack.append(char)
            }
        }
        guard stack.count % 2 == 0 else { return -1 }
        return res + ((stack.count % 4 == 0) ? stack.count / 2 : stack.count / 4 * 2 + 2)
    }
}