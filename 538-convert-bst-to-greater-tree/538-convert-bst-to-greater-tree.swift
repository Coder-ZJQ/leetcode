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
    private func rdlTraverse(_ node: TreeNode) -> [TreeNode] {
        var array = [node]
        if let right = node.right {
            array = rdlTraverse(right) + array
        }
        if let left = node.left {
            array += rdlTraverse(left)
        }
        return array
    }
    
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        if let node = root {
            let array = rdlTraverse(node)
            var sum = 0
            for node in array {
                sum += node.val
                node.val = sum
            }
        }
        return root
    }
}