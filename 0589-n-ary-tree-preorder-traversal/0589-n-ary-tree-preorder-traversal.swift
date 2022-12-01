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
    private var res = [Int]()
    private func dfs(_ node: Node) {
        res.append(node.val)
        for child in node.children {
            dfs(child)
        }
    }
    func preorder(_ root: Node?) -> [Int] {
        if let node = root {
            dfs(node)
        }
        return res
    }
}