class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for char in s {
            switch char {
            case "(", "[", "{":
                stack.append(char)
            case ")", "]", "}":
                if let last = stack.popLast() {
                    if (last == "(" && char != ")") ||
                        (last == "[" && char != "]") ||
                        (last == "{" && char != "}") {
                        return false
                    }
                } else {
                    return false
                }
            default:
                return false
            }
        }
        return stack.isEmpty
    }
}
