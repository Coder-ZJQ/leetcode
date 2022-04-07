
class LinkedNode {
    var key: Int
    var val: Int
    var pre: LinkedNode?
    var nxt: LinkedNode?
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}


class LRUCache {
    
    var head: LinkedNode
    var tail: LinkedNode
    var capacity: Int
    var dict: [Int: LinkedNode]

    init(_ capacity: Int) {
        head = LinkedNode(0, 0)
        tail = LinkedNode(0, 0)
        head.nxt = tail
        tail.pre = head
        dict = [Int: LinkedNode]()
        self.capacity = capacity
    }
    
    private func remove(_ node: LinkedNode) {
        let nxt = node.nxt,
            pre = node.pre
        nxt?.pre = pre
        pre?.nxt = nxt
    }
    
    private func add(_ node: LinkedNode) {
        let pre = tail.pre,
            tail = self.tail
        
        pre?.nxt = node
        node.pre = pre
        node.nxt = tail
        tail.pre = node
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            // 移除当前节点并链接
            remove(node)
            // 将当前节点移动至尾部
            add(node)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.val = value
            remove(node)
            add(node)
            return
        }
        let node = LinkedNode(key, value)
        add(node)
        dict[key] = node
        if dict.count > capacity {
            let n = head.nxt!
            remove(n)
            dict[n.key] = nil
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */