/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    
    func connect(_ root: Node?) -> Node? {
        guard let node = root else {
            return nil
        }
        var queue = [node]
        while !queue.isEmpty {
            var newQueue = [Node]()
            for i in 0..<queue.count {
                let node = queue[i]
                if i < queue.count - 1 {
                    node.next = queue[i + 1]
                }
                
                if let left = node.left {
                    newQueue.append(left)
                }
                if let right = node.right {
                    newQueue.append(right)
                }
            }
            queue = newQueue
        }
        return root
    }
}