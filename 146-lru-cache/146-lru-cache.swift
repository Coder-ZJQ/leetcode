
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
    
    /// 移除当前节点并使其前后节点相连接
    /// - Parameter node: 节点
    private func remove(_ node: LinkedNode) {
        let nxt = node.nxt,
            pre = node.pre
        nxt?.pre = pre
        pre?.nxt = nxt
    }
    
    /// 添加节点至尾部
    /// - Parameter node: 节点
    private func add(_ node: LinkedNode) {
        let pre = tail.pre,
            tail = self.tail
        pre?.nxt = node
        node.pre = pre
        node.nxt = tail
        tail.pre = node
    }
    
    /// 将双向链表中的节点移动到尾部
    /// - Parameter node: 节点
    private func moveToTail(_ node: LinkedNode) {
        // 先移除再追加，使其在尾部
        remove(node)
        add(node)
    }
    
    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            moveToTail(node)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        // 如果存在则更新节点值并将其移至尾部
        if let node = dict[key] {
            node.val = value
            moveToTail(node)
            return
        }
        // 如果不存在则添加节点至尾部
        let node = LinkedNode(key, value)
        add(node)
        dict[key] = node
        // 添加后如果超过容量则移除头部最久没访问的节点
        if dict.count > capacity {
            let n = head.nxt!
            remove(n)
            dict[n.key] = nil
        }
    }
}