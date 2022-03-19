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
    func tree2str(_ root: TreeNode?) -> String {
        guard let node = root else { return "" }
        var res = "\(node.val)"
        guard node.left != nil || node.right != nil else {
            return res
        }
        res += "(" + tree2str(node.left) + ")"
        if let right = node.right {
            res += "(" + tree2str(right) + ")"
        }
        return res
    }
}