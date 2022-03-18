class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        var stack = [Character]()
        var last = [Character: Int](), visited = Set<Character>()
        // 记录最后的索引
        for (i, c) in s.enumerated() {
            last[c] = i
        }
        for (i, c) in s.enumerated() {
            // 如果当前字符已遍历过则跳过该次遍历
            guard !visited.contains(c) else { continue }
            // 如果栈顶元素存在，且字典序在当前字符后，且当前字符此后还会出现
            // 则移除栈顶元素，并更新已遍历集合
            // 递归一直移除
            while let top = stack.last, top > c, last[top]! > i {
                stack.removeLast()
                visited.remove(top)
            }
            // 添加到栈顶，并更新已遍历集合
            stack.append(c)
            visited.insert(c)
        }
        return String(stack)
    }
}
