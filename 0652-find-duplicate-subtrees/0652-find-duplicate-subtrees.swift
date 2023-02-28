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
    
    private var collectSet = Set<String>()
    private var resultSet = Set<String>()
    private var res = [TreeNode?]()
    
    private func dfs(_ node: TreeNode) -> String {
        let left = node.left == nil ? "x" : dfs(node.left!)
        let right = node.right == nil ? "x" : dfs(node.right!)
        let string = "(\(left))<\(node.val)>(\(right))"
        if collectSet.contains(string) {
            if !resultSet.contains(string) {
                resultSet.insert(string)
                res.append(node)
            }
        } else {
            collectSet.insert(string)
        }
        return string
    }
    
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        if let node = root {
            dfs(node)
        }
        return res
    }
}