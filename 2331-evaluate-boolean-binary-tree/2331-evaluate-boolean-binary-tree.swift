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
    func evaluateTree(_ root: TreeNode?) -> Bool {
        let val = root!.val
        if val == 0 || val == 1 {
            return val == 1
        } else if val == 2 {
            return evaluateTree(root?.left) || evaluateTree(root?.right)
        } else {
            return evaluateTree(root?.left) && evaluateTree(root?.right)
        }
    }
}