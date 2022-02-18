class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        guard k < num.count else { return "0" }
        let chars = [Character](num)
        var stack = [Character]()
        var i = 0, k = k
        while i < chars.count {
            while let last = stack.last, k > 0, last.asciiValue! > chars[i].asciiValue! {
                stack.removeLast()
                k -= 1
            }
            stack.append(chars[i])
            i += 1
        }
        // 如果还需要移除则从末尾移除
        while k > 0 && !stack.isEmpty {
            stack.removeLast()
            k -= 1
        }
        
        // 移除首部的“0”
        while let first = stack.first, first == "0" {
            stack.removeFirst()
        }
        
        return stack.count == 0 ? "0" : String(stack)
    }
}