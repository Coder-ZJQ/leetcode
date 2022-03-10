/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */
class Solution {
    private func bfs(_ node: Node, _ array: inout [Int]) {
        array.append(node.val)
        for child in node.children {
            bfs(child, &array)
        }
    }
    func preorder(_ root: Node?) -> [Int] {
        guard let node = root else { return [] }
        var res = [Int]()
        bfs(node, &res)
        return res
    }
}