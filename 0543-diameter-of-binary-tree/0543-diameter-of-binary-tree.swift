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
    
    private var res = 0
    
    private func depth(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        let l = depth(node.left)
        let r = depth(node.right)
        res = max(res, l + r + 1)
        return max(l, r) + 1
    }
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        depth(root)
        return res - 1
    }
}
