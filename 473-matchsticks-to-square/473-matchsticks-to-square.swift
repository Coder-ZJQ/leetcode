class Solution {
    
    /// 记录四条边的长度
    private var edges = [Int](repeating: 0, count: 4)
    /// 从大到小排序后的火柴
    private var sticks = [Int]()
    /// 每条边需多长
    private var length = 0
    
    private func dfs(_ index: Int) -> Bool {
        if index == sticks.count {
            return true
        }
        
        let stick = sticks[index]
        for i in 0..<edges.count {
            edges[i] += stick
            if edges[i] <= length && dfs(index + 1) {
                return true
            }
            edges[i] -= stick
        }
        return false
    }
    
    func makesquare(_ matchsticks: [Int]) -> Bool {
        let sum = matchsticks.reduce(0, +)
        guard sum % 4 == 0 else { return false }
        // 设置变量的值
        sticks = matchsticks.sorted(by: >)
        length = sum / 4
        // 从第一条边开始递归
        return dfs(0)
    }
}
