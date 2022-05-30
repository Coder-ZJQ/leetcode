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
    var res: Int = 0
    
    private func dfs(_ node: TreeNode, _ val: Int) {
        let curVal = (val << 1) + node.val
        if node.right == nil && node.left == nil {
            res += curVal
        }
        if let left = node.left {
            dfs(left, curVal)
        }
        if let right = node.right {
            dfs(right, curVal)
        }
    }
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        if let node = root {
            dfs(node, 0)
        }
        return res
    }
}