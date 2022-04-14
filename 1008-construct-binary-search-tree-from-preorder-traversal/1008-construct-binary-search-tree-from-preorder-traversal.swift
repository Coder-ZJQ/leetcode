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
    
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        let root = TreeNode(preorder[0])
        var stack = [root]
        for val in preorder[1...] {
            var last = stack.last!
            let node = TreeNode(val)
            if val < last.val {
                last.left = node
            } else {
                last = stack.removeLast()
                while let lastNode = stack.last, lastNode.val < val {
                    last = stack.removeLast()
                }
                last.right = node
            }
            stack.append(node)
        }
        return root
    }
}