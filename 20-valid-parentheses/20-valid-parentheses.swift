class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let pair: [Character: Character] = ["{": "}", "[": "]", "(": ")"]
        for c in s {
            switch c {
            case "{", "[", "(":
                stack.append(c)
            case "}", "]", ")":
                if let last = stack.last {
                    if let p = pair[last], p == c {
                        stack.removeLast()
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            default:
                continue
            }
        }
        return stack.count == 0
    }
}
