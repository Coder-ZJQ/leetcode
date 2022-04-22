class BrowserHistory {
    private var history: [String]
    private var current = 0
    
    init(_ homepage: String) {
        history = [homepage]
    }
    
    func visit(_ url: String) {
        history.removeSubrange((current + 1)...)
        history.append(url)
        current = history.count - 1
    }
    
    func back(_ steps: Int) -> String {
        current = max(0, current - steps)
        return history[current]
    }
    
    func forward(_ steps: Int) -> String {
        current = min(history.count - 1, current + steps)
        return history[current]
    }
}

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * let obj = BrowserHistory(homepage)
 * obj.visit(url)
 * let ret_2: String = obj.back(steps)
 * let ret_3: String = obj.forward(steps)
 */