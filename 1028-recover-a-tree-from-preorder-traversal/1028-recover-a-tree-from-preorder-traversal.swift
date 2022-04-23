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
    func recoverFromPreorder(_ traversal: String) -> TreeNode? {
        let chars = [Character](traversal),
            n = chars.count
        var array = [[TreeNode]](), // 各层级数组
            level = 0,              // 当前遍历层级
            i = 0                   // 遍历索引
        
        while i < n {
            let c = chars[i]
            if c == "-" {
                level += 1
                i += 1
            } else {
                var num: String = ""
                while i < n && chars[i] != "-" {
                    num.append(chars[i])
                    i += 1
                }
                if array.count == level {
                    array.append([])
                }
                let node = TreeNode(Int(num) ?? 0)
                array[level].append(node)
                if level > 0 {
                    if let last = array[level - 1].last {
                        if last.left == nil {
                            last.left = node
                        } else {
                            last.right = node
                        }
                    }
                }
                level = 0
            }
        }
        return array.first?.first
    }
}