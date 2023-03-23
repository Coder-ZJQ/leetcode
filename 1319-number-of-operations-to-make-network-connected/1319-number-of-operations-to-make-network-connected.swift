
class UndirectedGraph {
    private var edges: [[Int]]
    private var visited: [Bool]
    private var connectionsCount: Int
    
    init(_ n: Int, _ connections: [[Int]]) {
        edges = [[Int]](repeating: [], count: n)
        for connection in connections {
            let point0 = connection[0],
                point1 = connection[1]
            edges[point0].append(point1)
            edges[point1].append(point0)
        }
        visited = [Bool](repeating: false, count: n)
        connectionsCount = connections.count
    }
    
    private func dfs(_ i: Int) {
        visited[i] = true
        for j in edges[i] where !visited[j] {
            dfs(j)
        }
    }
    
    var makeConnected: Int {
        let n = edges.count
        guard connectionsCount >= n - 1 else {
            return -1
        }
        
        var res = 0
        for i in 0..<n where !visited[i] {
            dfs(i)
            res += 1
        }
        
        return res - 1
    }
    
}


class Solution {
    
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        UndirectedGraph(n, connections).makeConnected
    }
}
