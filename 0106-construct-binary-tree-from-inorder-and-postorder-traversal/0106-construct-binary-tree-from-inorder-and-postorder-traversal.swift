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
 */class Solution {
    
    private var dict: [Int: Int] = [:]
    private var inorder: [Int] = []
    private var postorder: [Int] = []
    
    func buildTree(_ il: Int, _ ir: Int, _ pl: Int, _ pr: Int) -> TreeNode? {
        guard il <= ir && pl <= pr else {
            return nil
        }
        let node = TreeNode(postorder[pr])
        let index = dict[postorder[pr]]!
        node.left = buildTree(il, index - 1, pl, pl + index - il - 1)
        node.right = buildTree(index + 1, ir, pl + index - il, pr - 1)
        return node
    }
    
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        for (offset, element) in inorder.enumerated() {
            dict[element] = offset
        }
        self.inorder = inorder
        self.postorder = postorder
        return buildTree(0, inorder.count - 1, 0, postorder.count - 1)
    }
}