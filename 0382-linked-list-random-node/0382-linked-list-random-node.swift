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
    
    let head: ListNode?

    init(_ head: ListNode?) {
        self.head = head
    }
    
    func getRandom() -> Int {
        var i = 1, res = 0
        var head = head
        while let node = head {
            if Int.random(in: 0..<i) == 0 {
                res = node.val
            }
            head = node.next
            i += 1
        }
        return res
    }
}
/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(head)
 * let ret_1: Int = obj.getRandom()
 */