class Node {
    /// 当前字符
    var char: Character
    /// 当前字符连续重复数量
    var count: Int
    
    init(_ char: Character, _ count: Int) {
        self.char = char
        self.count = count
    }
}

class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        let chars = [Character](s)
        var stack = [Node]()
        for c in chars {
            if let last = stack.last, last.char == c {
                // 达到数量移除
                if last.count == k - 1 {
                    let n = stack.count
                    stack.removeSubrange((n - k + 1)...(n - 1))
                } else {
                    stack.append(Node(c, last.count + 1))
                }
            } else {
                stack.append(Node(c, 1))
            }
        }
        return String(stack.map(\.char))
    }
}