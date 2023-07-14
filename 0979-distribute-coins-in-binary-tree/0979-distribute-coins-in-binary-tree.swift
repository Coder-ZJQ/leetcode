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
    
    private var move = 0
    
    private func dfs(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        let moveLeft = dfs(node.left)
        let moveRight = dfs(node.right)
        move += abs(moveLeft) + abs(moveRight)
        return moveLeft + moveRight + node.val - 1
    }
    
    func distributeCoins(_ root: TreeNode?) -> Int {
        dfs(root)
        return move
    }
}
