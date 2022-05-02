class Solution {
    
    private func isValidTagName(_ tagName: String) -> Bool {
        guard tagName.count >= 1 && tagName.count <= 9 else { return false }
        for c in tagName where !c.isLetter || c.isLowercase {
            return false
        }
        return  true
    }
    
    func isValid(_ code: String) -> Bool {
        // 如果不是从标签开始，且长度不够起始加结束标签，则直接返回不合法
        guard let first = code.first, first == "<", code.count >= 7 else { return false }
        // 字符串扫描器
        let scanner = Scanner(string: code)
        // 标签栈，用以验证标签开闭是否配对
        var stack = [String]()
         
        while !scanner.isAtEnd {
            scanner.scanUpToString("<")
            
            if scanner.currentIndex < code.endIndex {
                let after = code[code.index(after: scanner.currentIndex)]
                
                if after == "/" {   // 结束标签
                    // 须有结束">"，同时标签栈不能为空
                    if let end = scanner.scanUpToString(">"), let last = stack.popLast() {
                        // 栈顶标签需和当前结束标签匹配
                        // 如果匹配，必须被标签包裹（例如："<A></A><B></B>" 为两组标签合并，没有被包裹所以不合法）
                        // 也就是判断栈为空时，需扫描到末尾
                        if "</" + last + ">" != end + ">" || (stack.isEmpty && scanner.currentIndex != code.index(before: code.endIndex)) {
                            return false
                        }
                    } else {
                        return false
                    }
                } else if after == "!" { // CDATA
                    guard !stack.isEmpty, let _ = scanner.scanUpToString("![CDATA["), let _ = scanner.scanUpToString("]]>") else {
                        return false
                    }
                } else { // 开始标签
                    if let start = scanner.scanUpToString(">") {
                        let startTagName = String(start[start.index(after: start.startIndex)...])
                        if isValidTagName(startTagName) {
                            stack.append(startTagName)
                        } else {
                            return false
                        }
                    }
                }
                
            }
            
        }
        return stack.isEmpty
    }
}