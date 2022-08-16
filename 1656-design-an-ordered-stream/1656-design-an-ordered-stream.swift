class OrderedStream {

    private var array: [String]
    private var ptr = 1
    
    init(_ n: Int) {
        array = [String].init(repeating: "", count: n + 1)
    }
    
    func insert(_ idKey: Int, _ value: String) -> [String] {
        array[idKey] = value
        
        var res = [String]()
        while ptr < array.count && !array[ptr].isEmpty {
            res.append(array[ptr])
            ptr += 1
        }
        
        return res
    }
}

/**
 * Your OrderedStream object will be instantiated and called as such:
 * let obj = OrderedStream(n)
 * let ret_1: [String] = obj.insert(idKey, value)
 */