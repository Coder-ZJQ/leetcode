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
    
    private var minDiff = Int.max
    private var preNode: TreeNode?
    
    private func inorderTraversal(_ root: TreeNode?) {
        guard let cur = root else { return }
        inorderTraversal(cur.left)
        if let pre = preNode {
            minDiff = min(minDiff, cur.val - pre.val)
        }
        preNode = cur
        inorderTraversal(cur.right)
    }
    
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        inorderTraversal(root)
        return minDiff
    }
}