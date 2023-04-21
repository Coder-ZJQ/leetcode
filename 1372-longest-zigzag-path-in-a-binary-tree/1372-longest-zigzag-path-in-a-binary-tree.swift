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
    
    @discardableResult
    private func dfs(_ root: TreeNode?) -> (l: Int, r: Int) {
        guard let node = root else {
            return (-1, -1)
        }
        let lr = dfs(node.left).r + 1
        let rl = dfs(node.right).l + 1
        res = max(res, max(lr, rl))
        return (lr, rl)
    }
    
    func longestZigZag(_ root: TreeNode?) -> Int {
        dfs(root)
        return res
    }
}