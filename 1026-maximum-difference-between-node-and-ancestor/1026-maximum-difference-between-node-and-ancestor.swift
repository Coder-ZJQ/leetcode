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
    
    private func dfs(_ root: TreeNode?, _ small: Int, _ big: Int) -> Int {
        guard let node = root else { return big - small }
        let small = min(node.val, small)
        let big = max(node.val, big)
        return max(dfs(node.left, small, big), dfs(node.right, small, big))
    }
    
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        dfs(root, root?.val ?? 0, root?.val ?? 0)
    }
}
