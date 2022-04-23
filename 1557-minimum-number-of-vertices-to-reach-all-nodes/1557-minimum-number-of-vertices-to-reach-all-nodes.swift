class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var reached = [Bool](repeating: false, count: n)
        for edge in edges {
            reached[edge[1]] = true
        }
        return reached.enumerated().filter {
            !$0.element
        }.map(\.offset)
    }
}
