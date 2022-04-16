/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    
    // right, root, left
    private func rdlTraverse(_ node: TreeNode, _ array: inout [TreeNode]) {
        if let right = node.right {
            rdlTraverse(right, &array)
        }
        array.append(node)
        if let left = node.left {
            rdlTraverse(left, &array)
        }
    }
    
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        if let node = root {
            var array = [TreeNode]()
            rdlTraverse(node, &array)
            var sum = 0
            for node in array {
                sum += node.val
                node.val = sum
            }
        }
        return root
    }
}