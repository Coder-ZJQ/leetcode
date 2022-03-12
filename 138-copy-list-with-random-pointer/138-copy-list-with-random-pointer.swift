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
        var it = head
        // 第一次遍历：复制下一节点指针
        // 1,2,3,4
        // 1,1,2,2,3,3,4,4
        while let node = it {
            let copy = Node(node.val)
            copy.next = node.next
            node.next = copy
            it = copy.next
        }
        it = head
        // 第二次遍历：复制随机节点指针
        while let node = it {
            if let random = node.random {
                node.next?.random = random.next
            }
            it = node.next?.next
        }
        it = head
        let dummy = Node(0)
        var copy: Node? = dummy
        // 第三次遍历：解开第一次复制的下一节点指针，还原原链表，并链接拷贝的链表
        while let node = it {
            copy?.next = node.next
            copy = copy?.next
            node.next = node.next?.next
            it = node.next
        }
        return dummy.next
    }
}