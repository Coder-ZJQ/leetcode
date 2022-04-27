class Solution {
    
    private var graph = [[Int]]()
    private var visited = [Bool]()
    
    private func union(_ i: Int) -> [Int] {
        guard !visited[i] else { return [] }
        visited[i] = true
        var res = [i]
        for to in graph[i] {
            res += union(to)
        }
        return res
    }
    
    func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
        let n = s.count
        graph = [[Int]](repeating: [], count: n)
        visited = [Bool](repeating: false, count: n)
        
        for pair in pairs {
            graph[pair[0]].append(pair[1])
            graph[pair[1]].append(pair[0])
        }
        
        var res = [Character](s)
        for i in 0..<n where !visited[i] && graph[i].count > 0 {
            let indexes = union(i).sorted()
            let chars = indexes.map {
                res[$0]
            }.sorted()
            
            for (i, char) in zip(indexes, chars) {
                res[i] = char
            }
            
        }
        
        return String(res)
    }
}