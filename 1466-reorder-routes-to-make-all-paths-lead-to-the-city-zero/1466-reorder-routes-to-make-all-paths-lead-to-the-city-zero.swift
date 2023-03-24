class Solution {
    
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var directedGraph = [[Int]](repeating: [], count: n)
        var undirectedGraph = [[Int]](repeating: [], count: n)
        for connection in connections {
            undirectedGraph[connection[0]].append(connection[1])
            undirectedGraph[connection[1]].append(connection[0])
            directedGraph[connection[0]].append(connection[1])
        }
        
        var res = 0
        var visited = [Bool](repeating: false, count: n)
        var queue = [0]
        while !queue.isEmpty {
            var array = [Int]()
            for from in queue {
                visited[from] = true
                res += directedGraph[from].filter({
                    !visited[$0]
                }).count
                array += undirectedGraph[from].filter({
                    !visited[$0]
                })
            }
            queue = array
        }
        
        return res
    }
}