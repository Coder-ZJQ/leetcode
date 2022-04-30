class Solution {
    
    /// ["被除数,除数": 值] 映射
    private var valueMap = [String: Double]()
    /// 构建无向图，节点为键，通向的节点集合为值
    private var graph = [String: Set<String>]()
    /// 记录是否已访问过该节点
    private var visited = Set<String>()
    
    private func dfs(_ query: [String], pre: Double) -> Double {
        let from = query[0], to = query[1]
        // 节点不存在图中的直接返回 -1.0
        guard let toSet = graph[from] else { return -1.0 }
        // 节点存在，但是被除数和除数相同则直接返回 1
        guard from != to else { return 1.0 }
        // 如果到达集合包含则直接返回
        if toSet.contains(to) {
            return pre * valueMap[from + "," + to]!
        }
        // 添加到已访问集合
        visited.insert(from)
        var res = -1.0
        // 继续访问下个未访问加点
        for next in toSet where !visited.contains(next) {
            let val = dfs([next, to], pre: pre * valueMap[from + "," + next]!)
            if val != -1.0 {
                res = val
                break
            }
        }
        // 回溯移除已访问节点
        visited.remove(from)
        return res
    }
    
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        
        let n = equations.count
        for i in 0..<n {
            let equation = equations[i]
            let value = values[i]
            
            // 建立值映射
            valueMap["\(equation[0]),\(equation[1])"] = value
            valueMap["\(equation[1]),\(equation[0])"] = 1.0 / value
            
            // 建立无向图
            if graph[equation[0]] != nil {
                graph[equation[0]]!.insert(equation[1])
            } else {
                graph[equation[0]] = Set(arrayLiteral: equation[1])
            }
            if graph[equation[1]] != nil {
                graph[equation[1]]!.insert(equation[0])
            } else {
                graph[equation[1]] = Set(arrayLiteral: equation[0])
            }
            
        }
        
        return queries.map { query in
            
            return dfs(query, pre: 1.0)
        }
    }
}