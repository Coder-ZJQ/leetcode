/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        // 为空的话也以"x"表示
        guard let node = root else { return "x," }
        // 先序遍历：[根节点, [左子树先序遍历结果], [右子树先序遍历结果]]
        return "\(node.val)," + serialize(node.left) + serialize(node.right)
    }
    
    
    private func _deserialize(_ array: [Substring], _ left: inout Int) -> TreeNode? {
        let rootStr = array[left]
        // 如果第一个是 x，即代表是空节点
        guard rootStr != "x" else {
            // 移动索引
            left += 1
            return nil
        }
        let rootValue = Int(rootStr)!
        
        // 初始化节点
        let node = TreeNode(rootValue)
        // 移动索引
        left += 1
        
        // 递归初始化左子树
        node.left = _deserialize(array, &left)
        // 递归初始化右子树
        node.right = _deserialize(array, &left)
        
        return node
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        // 以逗号分割
        let array = data.split(separator: ",")
        var left = 0
        return _deserialize(array, &left)
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))