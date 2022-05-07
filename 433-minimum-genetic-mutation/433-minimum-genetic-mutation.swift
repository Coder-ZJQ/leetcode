class Solution {
    
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        // 已经一样
        guard start != end else { return 0 }
        // 不一样，但是 bank 为空
        guard bank.count > 0 else { return -1 }
        let bankSet = Set(bank)
        // 不一样，bank 不为空，但是不包含结束节点
        guard bankSet.contains(end) else { return -1 }
        
        var visited = Set<String>([start]),
            queue: [String] = [start],
            res = 0
        
        while !queue.isEmpty {
            // 逐级访问
            for _ in 0..<queue.count {
                let first = queue.removeFirst()
                if first == end {
                    return res
                }
                var chars = [Character](first)
                for (i, char) in chars.enumerated() {
                    for choice in "ACGT" where choice != char {
                        // 修改
                        chars[i] = choice
                        let next = String(chars)
                        if !visited.contains(next) && bankSet.contains(next) {
                            // 已访问
                            visited.insert(next)
                            // 添加到队列
                            queue.append(next)
                        }
                        // 恢复
                        chars[i] = char
                    }
                }
            }
            res += 1
        }
        
        return -1
    }
}