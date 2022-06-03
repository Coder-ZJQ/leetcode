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

class FindElements {

    private var set = Set<Int>()
    
    private func dfs(_ node: TreeNode) {
        if let left = node.left {
            let val = node.val * 2 + 1
            left.val = val
            set.insert(val)
            dfs(left)
        }
        if let right = node.right {
            let val = node.val * 2 + 2
            right.val = val
            set.insert(val)
            dfs(right)
        }
    }
    
    init(_ root: TreeNode?) {
        if let node = root {
            node.val = 0
            set.insert(0)
            dfs(node)
        }
    }
    
    func find(_ target: Int) -> Bool {
        set.contains(target)
    }
}

/**
 * Your FindElements object will be instantiated and called as such:
 * let obj = FindElements(root)
 * let ret_1: Bool = obj.find(target)
 */