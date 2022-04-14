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
    
    private var array = [TreeNode]()
    
    private func inorderSearch(_ node: TreeNode?) {
        guard let node = node else { return }
        inorderSearch(node.left)
        array.append(node)
        inorderSearch(node.right)
    }
    
    private func balance(_ start: Int, _ end: Int) -> TreeNode? {
        guard start <= end else { return nil }
        let mid = start + (end - start) >> 1
        let root = array[mid]
        root.left = balance(start, mid - 1)
        root.right = balance(mid + 1, end)
        return root
    }
    
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        inorderSearch(root)
        return balance(0, array.count - 1)
    }
}