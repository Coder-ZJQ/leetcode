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
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let _ = head?.next else {
            return head
        }
        
        var current = head,
            length = 0
        while let node = current {
            length += 1
            current = node.next
        }
        
        let dummy = ListNode(0, head)
        
        var i = 1
        while i < length {
            var tail = dummy
            var cur = dummy.next
            
            while let node = cur {
                let left = node
                let right = split(left, i)
                cur = split(right, i)
                tail = merge(left, right, tail)
            }
            i <<= 1
        }
        
        return dummy.next
    }
    
    /// 将一个链表分割成两个链表
    /// 一个含有 length 个节点
    ///
    /// - Parameters:
    ///   - head: 需要分割的链表
    ///   - length: 分割的长度
    /// - Returns: 第二个链表的头部
    private func split(_ head: ListNode?, _ length: Int) -> ListNode? {
        var head = head,
        i = 1
        while let node = head, i < length {
            head = node.next
            i += 1
        }
        let second = head?.next
        head?.next = nil
        return second
    }
    
    /// 将两个已排序的链表合并，并接在 head 后
    /// - Parameters:
    ///   - node1: 第一个链表
    ///   - node2: 第二个链表
    ///   - head: 链表头部
    /// - Returns: 合并后的链表尾
    private func merge(_ node1: ListNode?, _ node2: ListNode?, _ head: ListNode) -> ListNode {
        var cur = head,
        node1 = node1,
        node2 = node2
        while let n1 = node1, let n2 = node2 {
            if n1.val > n2.val {
                cur.next = n2
                cur = n2
                node2 = n2.next
            } else {
                cur.next = n1
                cur = n1
                node1 = n1.next
            }
        }
        cur.next = node1 ?? node2
        while let next = cur.next {
            cur = next
        }
        return cur
    }   
}