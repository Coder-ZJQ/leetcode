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
    func allPossibleFBT(_ n: Int) -> [TreeNode?] {
        var res = [TreeNode?]()
        if n == 1 {
            res.append(TreeNode(0))
        } else {
            for i in stride(from: 1, to: n - 1, by: +2) {
                let lefts = allPossibleFBT(i)
                let rights = allPossibleFBT(n - 1 - i)
                for left in lefts {
                    for right in rights {
                        res.append(TreeNode(0, left, right))
                    }
                }
            }
        }
        
        return res
    }
}