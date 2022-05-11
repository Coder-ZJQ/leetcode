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
    
    // 先序遍历：[根节点, [左子树先序遍历结果], [右子树先序遍历结果]]
    // 中序遍历：[[左子树中序遍历结果], 根节点, [右子树中序遍历结果]]
    
    private var _valueIndexMap: [Int: Int] = [:]
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for (index, value) in inorder.enumerated() {
            _valueIndexMap[value] = index
        }
        let n = preorder.count
        return _buildTree(preorder, inorder, 0, n - 1, 0, n - 1)
    }
    
    private func _buildTree(_ preorder: [Int], _ inorder: [Int], _ preorderLeft: Int, _ preorderRight: Int, _ inorderLeft: Int, _ inorderRight: Int) -> TreeNode? {
        
        guard preorderLeft <= preorderRight else { return nil }
        
        // 先序遍历的起始位置便是根节点的值
        let rootValue = preorder[preorderLeft]
        
        // 根节点在中序遍历中的位置
        let rootIndex = _valueIndexMap[rootValue]!
        
        let node = TreeNode(rootValue)
        
        // 通过根节点在中序遍历中位置得到左子树节点数
        let leftTreeSize = rootIndex - inorderLeft
        
        // 遍历生成左子树
        node.left = _buildTree(preorder, inorder, preorderLeft + 1, preorderLeft + leftTreeSize, inorderLeft , rootIndex - 1)
        
        // 遍历生成右子树
        node.right = _buildTree(preorder, inorder, preorderLeft + leftTreeSize + 1, preorderRight, rootIndex + 1, inorderRight)
        
        return node
    }
}