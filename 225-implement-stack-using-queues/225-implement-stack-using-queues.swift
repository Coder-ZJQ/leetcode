
class MyStack {
    
    private var queue: [Int]
    
    init() {
        queue = []
    }
    
    func push(_ x: Int) {
        queue.append(x)
        let n = queue.count
        var i = 0
        while i < n - 1 {
            queue.append(queue.removeFirst())
            i += 1
        }
    }
    
    func pop() -> Int {
        queue.removeFirst()
    }
    
    func top() -> Int {
        queue.first!
    }
    
    func empty() -> Bool {
        queue.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */