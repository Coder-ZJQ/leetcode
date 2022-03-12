/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        let origin = head
        var head = head
        while let node = head {
            let copy = Node(node.val)
            copy.next = node.next
            node.next = copy
            head = copy.next
        }
        head = origin
        while let node = head {
            if let random = node.random {
                node.next?.random = random.next
            }
            head = node.next?.next
        }
        head = origin
        let dummy = Node(0)
        var copy: Node? = dummy
        while let node = head {
            copy?.next = node.next
            copy = copy?.next
            node.next = node.next?.next
            head = node.next
        }
        return dummy.next
    }
}