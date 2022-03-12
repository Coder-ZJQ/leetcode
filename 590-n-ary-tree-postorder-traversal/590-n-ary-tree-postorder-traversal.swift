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
        for child in node.children.reversed() {
            bfs(child, &array)
        }
    }
    func postorder(_ root: Node?) -> [Int] {
        var res = [Int]()
        if let node = root {
            bfs(node, &res)
        }
        return res.reversed()
    }
}