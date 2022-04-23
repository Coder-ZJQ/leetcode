class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var reached = Set<Int>()
        for edge in edges {
            reached.insert(edge[1])
        }
        return (0..<n).filter {
            !reached.contains($0)
        }
    }
}
