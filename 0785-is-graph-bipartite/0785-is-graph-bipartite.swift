class Graph {
    
    /// 将二分图的节点分为两个集合：
    
    /// 来自集合
    private var fromSet = Set<Int>()
    /// 到达集合
    private var toSet = Set<Int>()
    /// 图表
    private var graph:[[Int]]
    /// 纪录遍历状态
    private var visited: [Bool]
    
    init(_ graph: [[Int]]) {
        self.graph = graph
        visited = [Bool](repeating: false, count: graph.count)
    }
    
    private func visit(_ point: Int) {
        // 访问过的话直接返回
        guard !visited[point] else { return }
        // 添加到集合中
        fromSet.insert(point)
        // 设置已访问
        visited[point] = true
        // 继续遍历该节点可到达的节点
        for to in graph[point] {
            visited[to] = true
            toSet.insert(to)
            for from in graph[to] {
                visit(from)
            }
        }
    }
    
    var isBipartite: Bool {
        // 遍历各个节点
        for i in 0..<graph.count {
            visit(i)
        }
        // 集合不相交即为二分图
        return fromSet.isDisjoint(with: toSet)
    }
}

class Solution {
    
    func isBipartite(_ graph: [[Int]]) -> Bool {
        Graph(graph).isBipartite
    }
}
