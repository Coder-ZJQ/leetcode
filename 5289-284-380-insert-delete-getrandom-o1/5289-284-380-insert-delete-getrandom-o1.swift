class RandomizedSet {
    private var map: [Int: Int]
    private var arr: [Int]
    init() {
        map = [:]
        arr = []
    }
    
    func insert(_ val: Int) -> Bool {
        if let _ = map[val] {
            return false
        }
        arr.append(val)
        map[val] = arr.count - 1
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let index = map.removeValue(forKey: val) else {
            return false
        }
        let lastIndex = arr.count - 1
        let lastVal = arr.removeLast()
        if index < lastIndex {
            arr[index] = lastVal
            map[lastVal] = index
        }
        return true
    }
    
    func getRandom() -> Int {
        arr.randomElement()!
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */