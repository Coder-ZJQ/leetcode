
class MinStack {

    private var stack1: [Int]
    private var stack2: [Int]
    
    init() {
        stack1 = [Int]()
        stack2 = [Int]()
    }
    
    func push(_ val: Int) {
        stack1.append(val)
        if stack2.isEmpty || getMin() >= val {
            stack2.append(val)
        }
    }
    
    func pop() {
        if stack1.removeLast() == getMin() {
            stack2.removeLast()
        }
    }
    
    func top() -> Int {
        stack1.last!
    }
    
    func getMin() -> Int {
        stack2.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */