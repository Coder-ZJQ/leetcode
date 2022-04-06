class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        guard n > 1 else { return [0] }
        // 用以记录路径，索引为当前节点，对应数组为可到达节点
        var paths = [Set<Int>](repeating: Set(), count: n)
        for edge in edges {
            paths[edge[0]].insert(edge[1])
            paths[edge[1]].insert(edge[0])
        }
        
        // 获取所有叶子节点（即只能到达一个节点）
        var leaves = paths.enumerated().filter { (offset, element) in
            element.count == 1
        }.map(\.offset)
        
        // 节点总数
        var n = n
        // 从叶子到根节点一级级减少，知道节点总数少于等于 2，即不能再减少了
        while n > 2 {
            // 总数减去叶子节点数
            n -= leaves.count
            var newLeaves = [Int]()
            // 遍历叶子节点，
            for i in leaves {
                // 并拿到其所能到达的点
                let j = paths[i].removeFirst()
                // 从中移除叶子节点
                paths[j].remove(i)
                // 如果其节点数为 1 则也成为叶子节点
                if paths[j].count == 1 {
                    newLeaves.append(j)
                }
            }
            leaves = newLeaves
        }
        // 此时的叶子节点便是结果
        return leaves
    }
}
