/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */
class Solution {
    private func cloneGraph(_ cloned: inout [Int: Node], _ node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        if let clone = cloned[node.val] {
            return clone
        }
        let clone = Node(node.val)
        cloned[node.val] = clone
        clone.neighbors = node.neighbors.map({
            cloneGraph(&cloned, $0)
        })
        return clone
    }
    
    func cloneGraph(_ node: Node?) -> Node? {
        var cloned = [Int: Node]()
        return cloneGraph(&cloned, node)
    }
}