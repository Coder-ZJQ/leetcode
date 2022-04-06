class Solution {
    func makeGood(_ s: String) -> String {
        let chars = [Character](s)
        var stack = [Character]()
        for char in chars {
            if let last = stack.last {
                if last >= "A" && last <= "Z" {
                    if last.lowercased().first! == char {
                        stack.removeLast()
                    } else {
                        stack.append(char)
                    }
                } else {
                    if last.uppercased().first! == char {
                        stack.removeLast()
                    } else {
                        stack.append(char)
                    }
                }
            } else {
                stack.append(char)
            }
        }
        return String(stack)
    }
}
