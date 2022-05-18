class Graph {
    
    /// 利用数组代表无向图（索引为节点，值为其可到达节点数组）
    private var graph: [[Int]]
    /// 遍历时间戳数组（索引为节点，值为时间戳）
    private var dfn: [Int]
    /// 能追溯的最早的时间戳数组（索引为节点，值为最早时间戳）
    private var low: [Int]
    /// 结果数组
    private var res = [[Int]]()
    /// 当前时间戳
    private var timestamp = 0
    
    init(_ n: Int, _ connections: [[Int]]) {
        // 根据参数初始一些辅助变量
        graph = [[Int]](repeating: [Int](), count: n)
        for connection in connections {
            graph[connection[0]].append(connection[1])
            graph[connection[1]].append(connection[0])
        }
        dfn = [Int](repeating: 0, count: n)
        low = [Int](repeating: 0, count: n)
    }
    
    /// tarjan 算法
    /// https://baike.baidu.com/item/tarjan%E7%AE%97%E6%B3%95/10687825
    ///
    /// - Parameters:
    ///   - cur: 当前节点
    ///   - from: 当前节点的父节点
    private func tarjan(cur: Int, from: Int) {
        // 累加时间戳
        timestamp += 1
        // 赋值当前时间戳
        dfn[cur] = timestamp
        // 暂时先赋值当前时间戳
        low[cur] = timestamp
        // 遍历下一个节点（不包含父节点）
        for next in graph[cur] where next != from {
            // 如果没有访问过
            if dfn[next] == 0 {
                // 递归调用 tarjan 算法
                tarjan(cur: next, from: cur)
                // 取最小值修改最早时间戳
                low[cur] = min(low[cur], low[next])
                // 如果不在环上添加到结果
                if dfn[cur] < low[next] {
                    res.append([cur, next])
                }
            } else {
                // 如果已经访问过，取最小值修改最早时间戳
                low[cur] = min(low[cur], dfn[next])
            }
        }
    }
    
    lazy var criticalConnections: [[Int]] = {
        for i in 0..<graph.count {
            // 判断没有遍历过，避免重复遍历
            if dfn[i] == 0 {
                tarjan(cur: i, from: -1)
            }
        }
        return res
    }()
}


class Solution {
    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        Graph(n, connections).criticalConnections
    }
}
