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
    private func dfs(_ node: TreeNode?, _ val: Int) -> Bool {
        guard let node = node else {
            return true
        }
        return node.val == val && dfs(node.left, val) && dfs(node.right, val)
    }
    
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        dfs(root, root?.val ?? 0)
    }
}