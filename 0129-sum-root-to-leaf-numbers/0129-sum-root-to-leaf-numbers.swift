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

    private func dfs(_ pre: Int, _ node: TreeNode) {
        let sum = pre * 10 + node.val
        var hasLeft = false, hasRight = false
        if let left = node.left {
            dfs(sum, left)
            hasLeft = true
        }
        if let right = node.right {
            dfs(sum, right)
            hasRight = true
        }
        if !hasLeft && !hasRight {
            res += sum
        }
    }

    func sumNumbers(_ root: TreeNode?) -> Int {
        if let node = root {
            dfs(0, node)
        }
        return res
    }
}