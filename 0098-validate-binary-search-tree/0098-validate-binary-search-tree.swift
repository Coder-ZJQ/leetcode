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
    
    private func isValidBST(_ node: TreeNode?, _ min: Int, _ max: Int) -> Bool {
        guard let node = node else { return true }
        return node.val < max && node.val > min && isValidBST(node.left, min, node.val) && isValidBST(node.right, node.val, max)
    }
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        isValidBST(root, Int.min, Int.max)
    }
}
