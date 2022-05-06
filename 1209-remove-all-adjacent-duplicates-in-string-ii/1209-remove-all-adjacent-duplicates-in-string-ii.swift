class Node {
    var char: Character
    var count: Int
    init(_ char: Character, _ count: Int) {
        self.char = char
        self.count = count
    }
}


class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        // 字符串不能为空，连续重复字符需超过 1
        guard s.count > 0 && k > 1 else { return "" }
        let chars = [Character](s)
        var stack = [Node]()
        for c in chars {
            if let last = stack.last {
                if last.char == c {
                    if last.count == k - 1 {
                        let n = stack.count
                        stack.removeSubrange((n - k + 1)...(n - 1))
                    } else {
                        stack.append(Node(c, last.count + 1))
                    }
                } else {
                    stack.append(Node(c, 1))
                }
            } else {
                stack.append(Node(c, 1))
            }
        }
        return String(stack.map(\.char))
    }
}