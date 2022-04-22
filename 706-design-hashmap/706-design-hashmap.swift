
class MyHashMap {
    // 数组，用以保存数据
    private var array: [[(Int, Int)]]
    // 容量，可根据添加元素数量扩充，初始为 100
    private var capacity = 100
    // 元素 : 容量，超过则扩充容量
    private let factor: Double = 0.75
    // 每次扩充的数量
    private let expand = 100
    // 当前元素数量
    private var count = 0

    init() {
        array = [[(Int, Int)]](repeating: [], count: capacity)
    }
    
    func put(_ key: Int, _ value: Int) {
        while Int(factor * Double(capacity)) <= count {
            array += [[(Int, Int)]](repeating: [], count: expand)
            var rehashes = [(Int, Int)]()
            for i in 0..<capacity where !array[i].isEmpty {
                var hashed = [(Int, Int)]()
                for (k, v) in array[i] {
                    if k < capacity {
                        hashed.append((k, v))
                    } else {
                        rehashes.append((k, v))
                    }
                }
                array[i] = hashed
            }
            capacity += expand
            for (k, v) in rehashes {
                array[k % capacity].append((k, v))
            }
        }
        let hash = key % capacity
        for i in 0..<array[hash].count {
            
            if array[hash][i].0 == key {
                array[hash][i].1 = value
                return
            }
        }
        array[hash].append((key, value))
        count += 1
    }
    
    
    func get(_ key: Int) -> Int {
        
        let hash = key % capacity
        
        if let tuple = array[hash].first(where: {
            $0.0 == key
        }) {
            return tuple.1
        }
        return -1
    }
    
    func remove(_ key: Int) {
        let hash = key % capacity
        
        if let index = array[hash].firstIndex(where: {
            $0.0 == key
        }) {
            array[hash].remove(at: index)
            count -= 1
        }
    }
    
}


/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */