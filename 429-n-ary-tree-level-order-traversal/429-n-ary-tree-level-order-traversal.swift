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
    private func bfs(_ node: Node, _ array: inout [[Int]], _ level: Int) {
        if array.count <= level {
            array.append([])
        }
        array[level].append(node.val)
        for child in node.children {
            bfs(child, &array, level + 1)
        }
    }
    func levelOrder(_ root: Node?) -> [[Int]] {
        var res = [[Int]]()
        if let node = root {
            bfs(node, &res, 0)
        }
        return res
    }
}