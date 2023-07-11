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
class Solution {
    
    private func nodesOfLevel(_ from: TreeNode, _ level: Int, _ exclude: Set<Int>) -> [Int] {
        var queue = [from], i = level
        while i > 0 {
            var array: [TreeNode] = []
            for node in queue {
                if let left = node.left, !exclude.contains(left.val) {
                    array.append(left)
                }
                if let right = node.right, !exclude.contains(right.val) {
                    array.append(right)
                }
            }
            queue = array
            i -= 1
        }
        return queue.map(\.val)
    }
    
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        guard let node = root else {
            return []
        }
        // 简历父节点映射
        var queue = [node]
        var parents = [Int: TreeNode]()
        while !queue.isEmpty {
            var array: [TreeNode] = []
            for node in queue {
                if let left = node.left {
                    array.append(left)
                    parents[left.val] = node
                }
                if let right = node.right {
                    array.append(right)
                    parents[right.val] = node
                }
            }
            queue = array
        }
        var res = [Int]()
        if let target = target {
            // 逐级遍历父节点，并获取父节点下对应层数子节点的值
            var parent: TreeNode? = target
            var exclude = Set<Int>()
            for i in 0...k {
                if let from = parent {
                    res += nodesOfLevel(from, k - i, exclude)
                    parent = parents[from.val]
                    exclude.insert(from.val)
                }
            }
        }
        return res
    }
}