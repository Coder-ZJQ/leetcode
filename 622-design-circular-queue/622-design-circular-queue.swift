class ListNode {
    var val: Int
    var next: ListNode?
    init(val: Int) {
        self.val = val
    }
}

class MyCircularQueue {
    
    private var head: ListNode?
    private var tail: ListNode?
    private let capacity: Int
    private var count: Int = 0

    init(_ k: Int) {
        capacity = k
    }
    
    func enQueue(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        let node = ListNode(val: value)
        if let rear = tail {
            rear.next = node
            node.next = head
        } else {
            node.next = node
            head = node
        }
        tail = node
        count += 1
        return true
    }
    
    func deQueue() -> Bool {
        if isEmpty() {
            return false
        }
        if let front = head {
            count -= 1
            if isEmpty() {
                head = nil
                tail = nil
            } else {
                head = front.next
                tail?.next = head
            }
            return true
        } else {
            return false
        }
    }
    
    func Front() -> Int {
        head?.val ?? -1
    }
    
    func Rear() -> Int {
        tail?.val ?? -1
    }
    
    func isEmpty() -> Bool {
        count == 0
    }
    
    func isFull() -> Bool {
        count == capacity
    }
}

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 */