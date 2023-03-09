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
    func detectCycle(_ head: ListNode?) -> ListNode? {
        // 快慢指针
        var slow = head,
            fast = head
        while let node = fast?.next?.next {
            // 向下移动快慢指针
            fast = node
            slow = slow?.next
            // 快慢指针相遇
            if slow === fast {
                var entry = head
                while entry !== slow {
                    slow = slow?.next
                    entry = entry?.next
                }
                return entry
            }
        }
        return nil
    }
}