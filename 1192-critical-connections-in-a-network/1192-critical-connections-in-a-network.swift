class Graph {
    
    /// 利用数组代表无向图（索引为起始点，值为其可到达节点集合）
    private var graph: [[Int]]
    private var dfn: [Int]
    private var low: [Int]
    private var res = [[Int]]()
    private var timestamp = 0
    
    lazy var criticalConnections: [[Int]] = {
        for i in 0..<graph.count {
            if dfn[i] == 0 {
                tarjan(cur: i, from: -1)
            }
        }
        return res
    }()
    
    init(_ n: Int, _ connections: [[Int]]) {
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
        timestamp += 1
        dfn[cur] = timestamp
        low[cur] = timestamp
        for next in graph[cur] where next != from {
            if dfn[next] == 0 {
                tarjan(cur: next, from: cur)
                low[cur] = min(low[cur], low[next])
                if dfn[cur] < low[next] {
                    res.append([cur, next])
                }
            } else {
                low[cur] = min(low[cur], dfn[next])
            }
        }
    }
}


class Solution {
    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        Graph(n, connections).criticalConnections
    }
}