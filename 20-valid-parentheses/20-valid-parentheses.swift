class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        var stack = [Character]()
        let dict: [Character: Character] = ["}": "{", ")": "(", "]": "["]
        for char in s {
            switch char {
            case "(", "{", "[":
                stack.append(char)
            case ")", "}", "]":
                if let last = stack.last {
                    if last == dict[char] {
                        stack.removeLast()
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            default:
                return false
            }
        }
        return stack.count == 0
    }
}
