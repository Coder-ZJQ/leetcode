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
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        var head = head
        var arr = [ListNode]()
        while let node = head {
            if node.val == 0, let next = node.next {
                if let last = arr.last {
                    last.next = next
                }
                arr.append(next)
                head = next.next
            } else{
                arr.last!.val += node.val
                head = node.next
            }
        }
        if let last = arr.last {
            last.next = nil
        }
        return arr.first
    }
}
