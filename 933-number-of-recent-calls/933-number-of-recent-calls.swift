
class RecentCounter {
    private var requests: [Int]
    init() {
        requests = []
    }
    
    func ping(_ t: Int) -> Int {
        requests.append(t)
        var res = 0, i = requests.count - 1
        while i >= 0 && requests[i] >= t - 3000 {
            res += 1
            i -= 1
        }
        return res
    }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */
