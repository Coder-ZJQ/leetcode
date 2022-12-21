class DislikeGraph {
    
    /// 人数（1 ~ n）
    private var n: Int
    /// 不喜欢关系图
    private var graph: [[Int]]
    /// 染色表（0: 未染色，1: 红色，2: 蓝色）
    private var colors: [Int]
    
    init(n: Int, dislikes: [[Int]]) {
        self.n = n
        graph = [[Int]](repeating: [Int](), count: n + 1)
        for dislike in dislikes {
            graph[dislike[0]].append(dislike[1])
            graph[dislike[1]].append(dislike[0])
        }
        
        colors = [Int](repeating: 0, count: n + 1)
    }
    
    var isValid: Bool {
        /// 按编号遍历未染色的人
        for person in 1...n where colors[person] == 0 {
            if !dfs(person: person, color: 1) {
                return false
            }
        }
        return true
    }
    
    
    private func dfs(person: Int, color: Int) -> Bool {
        colors[person] = color
        for next in graph[person] {
            // 不喜欢的已染色，且颜色相同则直接返回不合法
            if colors[next] != 0 && colors[next] == color {
                return false
            }
            // 未染色，dfs 遍历
            if colors[next] == 0 && !dfs(person: next, color: color == 1 ? 2 : 1) {
                return false
            }
        }
        return true
    }
}

class Solution {
    
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        DislikeGraph(n: n, dislikes: dislikes).isValid
    }
    
}