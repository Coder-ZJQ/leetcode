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
    
    /// 返回从跟节点开始值相同的长度
    private func dfs(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        let leftLength = dfs(node.left), rightLength = dfs(node.right)
        var leftL = 0, rightL = 0
        if let left = node.left, left.val == node.val {
            leftL = leftLength + 1
        }
        
        if let right = node.right, right.val == node.val {
            rightL = rightLength + 1
        }
        res = max(res, leftL + rightL)
        return max(leftL, rightL)
    }
    
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        dfs(root)
        return res
    }
}