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
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        if let node = root {
            if depth == 1 {
                return TreeNode(val, root, nil)
            } else if depth == 2 {
                node.left = TreeNode(val, node.left, nil)
                node.right = TreeNode(val, nil, node.right)
            } else {
                node.left = addOneRow(node.left, val, depth - 1)
                node.right = addOneRow(node.right, val, depth - 1)
            }
        }
        return root
    }
}
