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
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val >= low && root.val <= high {
            root.left = trimBST(root.left, low, high)
            root.right = trimBST(root.right, low, high)
            return root
        } else {
            if let node = trimBST(root.left, low, high) {
                return node
            }
            if let node = trimBST(root.right, low, high) {
                return node
            }
            return nil
        }
    }
}