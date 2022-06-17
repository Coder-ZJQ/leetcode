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
    private func dfs(_ root: TreeNode?) -> (Int, Int, Int) {
        guard let node = root else {
            return (Int.max / 2, 0, 0)
        }
        let (la, lb, lc) = dfs(node.left)
        let (ra, rb, rc) = dfs(node.right)
        let a = lc + rc + 1
        return (a,
                min(a, min(la + rb, ra + lb)),
                min(a, lb + rb))
        
    }
    func minCameraCover(_ root: TreeNode?) -> Int {
        dfs(root).1
    }
}