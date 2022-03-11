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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let _ = head else {
            return nil
        }
        var head = head,
            array = [ListNode]()
        while let node = head {
            array.append(node)
            head = node.next
        }
        let n = array.count
        let index = (n - k % n) % n
        guard index > 0 else { return array.first }
        head = array[index]
        array.last?.next = array.first
        array[index - 1].next = nil
        return head
    }
}