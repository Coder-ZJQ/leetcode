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
    
    private func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if let node = root {
            return inorderTraversal(node.left) + [node.val] + inorderTraversal(node.right)
        }
        return []
    }
    
    func minDiffInBST(_ root: TreeNode?) -> Int {
        let inorder = inorderTraversal(root)
        var res = Int.max, pre = inorder[0]
        for cur in inorder[1...] {
            res = min(res, cur - pre)
            pre = cur
        }
        return res
    }
}
