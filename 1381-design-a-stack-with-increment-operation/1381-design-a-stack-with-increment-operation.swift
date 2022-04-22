
class CustomStack {
    private var array: [Int]
    private var current = 0
    init(_ maxSize: Int) {
        array = [Int](repeating: 0, count: maxSize)
    }
    
    func push(_ x: Int) {
        guard current < array.count else { return }
        array[current] = x
        current += 1
    }
    
    func pop() -> Int {
        guard current > 0 else { return -1 }
        current -= 1
        return array[current]
    }
    
    func increment(_ k: Int, _ val: Int) {
        for i in 0..<min(k, array.count) {
            array[i] += val
        }
    }
}

/**
 * Your CustomStack object will be instantiated and called as such:
 * let obj = CustomStack(maxSize)
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * obj.increment(k, val)
 */