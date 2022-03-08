/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head, fast = head?.next?.next
        while let s = slow, let f = fast {
            if s === f {
                return true
            }
            slow = s.next
            fast = f.next?.next
        }
        return false
    }
}