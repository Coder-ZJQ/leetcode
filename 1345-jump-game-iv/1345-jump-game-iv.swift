class Solution {
    func minJumps(_ arr: [Int]) -> Int {
        let n = arr.count
        guard n > 1 else { return 0 }
        // 记录所有值的索引
        var indexesOfValue = [Int: [Int]]()
        for (index, value) in arr.enumerated() {
            indexesOfValue[value, default: []].append(index)
        }
        
        // 记录是否已访问过该索引
        var visited = [Bool](repeating: false, count: n)
        
        // 当前可到达的位置
        var cur = [0], jump = 0
        
        while !cur.isEmpty {
            // 下一次可到达的位置
            var nxt = [Int]()
            
            // 遍历当前可到达的位置
            for i in cur {
                // 如果可到达末尾则直接返回
                if i == n - 1 {
                    return jump
                }
                
                // 将相同值且没访问过的索引添加到下一次数组
                for to in indexesOfValue[arr[i], default: []] {
                    if !visited[to] {
                        visited[to] = true
                        nxt.append(to)
                    }
                }
                
                // 清空索引，避免重复搜索
                indexesOfValue[arr[i]] = nil
                
                // 将邻居添加到下一次
                if i + 1 < n && !visited[i + 1] {
                    visited[i + 1] = true
                    nxt.append(i + 1)
                }
                if i - 1 >= 0 && !visited[i - 1] {
                    visited[i - 1] = true
                    nxt.append(i - 1)
                }
                
            }
            
            cur = nxt
            jump += 1
        }
        return -1
    }
}