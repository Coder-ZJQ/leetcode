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
    
    private var cloned = [Node?](repeating: nil, count: 101)
    
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        if let clone = cloned[node.val] {
            return clone
        }
        var res = Node(node.val)
        cloned[node.val] = res
        res.neighbors = node.neighbors.map({
            cloneGraph($0)
        })
        return res
    }
}