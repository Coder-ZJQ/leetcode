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
    var res = 0
    
    private func bfs(_ node: TreeNode, _ val: Int) {
        if node.val >= val {
            res += 1
        }
        let next = max(node.val, val)
        if let left = node.left {
            bfs(left, next)
        }
        if let right = node.right {
            bfs(right, next)
        }
    }
    
    func goodNodes(_ root: TreeNode?) -> Int {
        if let node = root {
            bfs(node, node.val)
        }
        return res
    }
}