/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        // 如果只有一个节点之间移除，即返回 nil
        guard let _ = head?.next else { return nil }
        // 快慢指针
        var slow = head, fast = head?.next?.next
        while let node = fast?.next {
            fast = node.next
            slow = slow!.next
        }
        slow?.next = slow?.next?.next
        return head
    }
}

