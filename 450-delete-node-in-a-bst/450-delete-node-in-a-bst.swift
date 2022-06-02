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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let node = root else {
            return nil
        }
        let val = node.val
        if val == key {
            if node.left == nil || node.right == nil {
                return node.left ?? node.right
            }
            // 找到顶替当前删除节点的值
            
            /*
            // 可以是左边最大的
            var maxNode = node.left!
            while let right = maxNode.right {
                maxNode = right
            }
            node.val = maxNode.val
            // 递归删除顶替的节点
            node.left = deleteNode(node.left, node.val)
            */
            
            // 也可以是右边最小的
            var minNode = node.right!
            while let left = minNode.left {
                minNode = left
            }
            node.val = minNode.val
            // 递归删除顶替的节点
            node.right = deleteNode(node.right, node.val)
        } else if val > key {
            node.left = deleteNode(node.left, key)
        } else {
            node.right = deleteNode(node.right, key)
        }
        return node
    }
}