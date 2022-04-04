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
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        var first = head, second = head
        // 先找到第 k 个节点
        for _ in 1..<k {
            first = first?.next
        }
        // 第 k 个节点与头节点同步移动，
        // 当没有下个节点时既是第二个节点
        var checker = first
        while let next = checker?.next {
            checker = next
            second = second?.next
        }
        // 交换两个节点的值
        (first!.val, second!.val) = (second!.val, first!.val)
        return head
    }
}