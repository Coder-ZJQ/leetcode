class Node: Hashable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.val == rhs.val && lhs.mask == rhs.mask
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(mask)
    }
    
    /// 节点值
    var val: Int
    /// 用于记录结果
    var cost: Int
    /// 掩码，每个二进制位用以记录经过的节点（0: 未经过，1: 经过）
    var mask: Int
    
    init(val: Int, cost: Int, mask: Int) {
        self.val = val
        self.cost = cost
        self.mask = mask
    }
}


class Solution {
    func shortestPathLength(_ graph: [[Int]]) -> Int {
        let n = graph.count
        
        // 节点全部经过的掩码
        let fullMask = (1 << n) - 1

        var visited = Set<Node>()
        var queue = [Node]()

        for i in 0..<n {
            let node = Node(val: i, cost: 1, mask: 1 << i)
            visited.insert(node)
            queue.append(node)
        }

        while !queue.isEmpty {
            let node = queue.removeFirst()
            if node.mask == fullMask {
                return node.cost - 1
            }
            for next in graph[node.val] {
                let mask = node.mask | (1 << next)
                let nextNode = Node(val: next, cost: node.cost + 1, mask: mask)
                if !visited.contains(nextNode) {
                    queue.append(nextNode)
                    visited.insert(nextNode)
                }
            }
        }

        return -1
    }

}