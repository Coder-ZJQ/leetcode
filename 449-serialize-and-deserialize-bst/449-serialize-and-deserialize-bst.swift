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
    
    /// 先序遍历所有节点到数组
    /// [根节点, [左子树先序遍历结果], [右子树先序遍历结果]]
    private func _preorderTraversal(_ node: TreeNode?) -> [String] {
        guard let node = node else {
            return []
        }
        return ["\(node.val)"] + _preorderTraversal(node.left) + _preorderTraversal(node.right)
    }
    
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        guard let node = root else { return "" }
        let array = _preorderTraversal(node)
        return array.joined(separator: ",")
    }
    
    
    private func _deserialize(_ values: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        guard left <= right else { return nil }
        
        // 第一个为根节点的值
        let rootValue = values[left]
        
        // 寻找第一个比根节点大的位置
        var i = left + 1
        while i <= right && values[i] < rootValue {
            i += 1
        }
        
        // 初始化节点
        let node = TreeNode(rootValue)
        
        // 递归从新的范围生成左子树
        node.left = _deserialize(values, left + 1, i - 1)
        
        // 递归从新的范围生成右子树
        node.right = _deserialize(values, i, right)
        return node
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        let array = data.split(separator: ",").map {
            Int($0)!
        }
        let n = array.count
        guard n > 0 else { return nil }
        return _deserialize(array, 0, n - 1)
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let ser = Codec()
 * let deser = Codec()
 * let tree: String = ser.serialize(root)
 * let ans = deser.deserialize(tree)
 * return ans
*/