class Solution {
    private var n = 0
    private var res = [Int]()
    private func dfs(_ cur: Int) {
        for i in 0...9 {
            let num = cur * 10 + i
            if num <= n {
                res.append(num)
                dfs(num)
            }
        }
    }
    
    func lexicalOrder(_ n: Int) -> [Int] {
        self.n = n
        for i in 1...min(9, n) {
            res.append(i)
            dfs(i)
        }
        return res
    }
}