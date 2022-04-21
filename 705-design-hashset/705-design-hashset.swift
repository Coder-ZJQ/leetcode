
class MyHashSet {
    // 数组，用以保存数据
    private var array: [[Int]]
    // 容量，可根据添加元素数量扩充，初始为 100
    private var capacity = 100
    // 元素 : 容量，超过则扩充容量
    private let factor: Double = 0.75
    // 每次扩充的数量
    private let expand = 100
    // 当前元素数量
    private var count = 0

    init() {
        array = [[Int]](repeating: [], count: capacity)
    }
    
    func add(_ key: Int) {
        guard !contains(key) else {
            return
        }
        // 超过则扩充容量
        while Int(factor * Double(capacity)) <= count {
            // 扩充容量
            array += [[Int]](repeating: [], count: expand)
            // 重新散列
            var rehashes = [Int]()
            for i in 0..<capacity where !array[i].isEmpty {
                var hashed = [Int]()
                for key in array[i] {
                    if key < capacity {
                        hashed.append(key)
                    } else {
                        rehashes.append(key)
                    }
                }
                array[i] = hashed
            }
            capacity += expand
            for key in rehashes {
                array[key % capacity].append(key)
            }
        }
        // 添加到散列表
        let hash = key % capacity
        array[hash].append(key)
        count += 1
    }
    
    func remove(_ key: Int) {
        guard contains(key) else {
            return
        }
        let hash = key % capacity
        
        if let index = array[hash].firstIndex(of: key) {
            array[hash].remove(at: index)
            count -= 1
        }
    }
    
    func contains(_ key: Int) -> Bool {
        let hash = key % capacity
        for val in array[hash] {
            if val == key {
                return true
            }
        }
        return false
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */