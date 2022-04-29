class Solution {
    
    private var fromSet = Set<Int>()
    private var toSet = Set<Int>()
    private var graph = [[Int]]()
    private var visited = [Bool]()
    
    private func visit(_ point: Int) {
        guard !visited[point] else { return }
        fromSet.insert(point)
        visited[point] = true
        for to in graph[point] {
            visited[to] = true
            toSet.insert(to)
            for from in graph[to] {
                visit(from)
            }
        }
    }
    
    func isBipartite(_ graph: [[Int]]) -> Bool {
        
        self.graph = graph
        visited = [Bool](repeating: false, count: graph.count)
        
        for i in 0..<graph.count {
            visit(i)
        }
        
        return fromSet.intersection(toSet).count == 0
    }
}