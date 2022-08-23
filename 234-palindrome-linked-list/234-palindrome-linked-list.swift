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
    func isPalindrome(_ head: ListNode?) -> Bool {
        var array = [Int]()
        var node = head
        while let n = node {
            array.append(n.val)
            node = n.next
        }
        var l = 0, r = array.count - 1
        while l < r {
            if array[l] != array[r] {
                return false
            }
            l += 1
            r -= 1
        }
        return true
    }
}