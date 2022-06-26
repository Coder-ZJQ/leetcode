class Solution {

    private let black2whiteMap: [Int: Int]
    private let bound: Int
    
    init(_ n: Int, _ blacklist: [Int]) {
        let m = blacklist.count
        let bound = n - m
        let blacklistSet = Set(blacklist.filter({
            $0 >= bound
        }))
        var start = bound, map = [Int: Int]()
        for i in blacklist where i < bound {
            while blacklistSet.contains(start) {
                start += 1
            }
            map[i] = start
            start += 1
        }
        self.bound = bound
        self.black2whiteMap = map
    }
    
    func pick() -> Int {
        let randomIndex = (0..<bound).randomElement()!
        return black2whiteMap[randomIndex] ?? randomIndex
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(n, blacklist)
 * let ret_1: Int = obj.pick()
 */