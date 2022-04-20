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

class BSTIterator {
    private var current: TreeNode?
    private var stack: [TreeNode]

    init(_ root: TreeNode?) {
        current = root
        stack = []
    }
    
    func next() -> Int {
        while let cur = current {
            stack.append(cur)
            current = cur.left
        }
        let next = stack.removeLast()
        current = next.right
        return next.val
    }
    
    func hasNext() -> Bool {
        current != nil || !stack.isEmpty
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */