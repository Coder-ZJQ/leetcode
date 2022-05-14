class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        // key: 出发节点，value: (到达节点, 消耗)
        var graph = [[(Int, Int)]](repeating: [], count: n + 1)
        for time in times {
            graph[time[0]].append((time[1], time[2]))
        }
        // 记录到每个节点的最短距离
        var distances = [Int](repeating: Int.max, count: n + 1)
        // 到起始节点 k 的距离设置为 0
        distances[k] = 0
        
        // 用以记录当前到达节点
        var queue = [k]
        while !queue.isEmpty {
            var newQueue = [Int]()
            for from in queue {
                for to in graph[from] {
                    let distance = distances[from] + to.1
                    if distance < distances[to.0] {
                        distances[to.0] = distance
                        newQueue.append(to.0)
                    }
                }
            }
            queue = newQueue
        }
        
        var res = 0
        for distance in distances[1...n] {
            // 如果存在不能到达的节点，直接返回 -1
            if distance == Int.max {
                return -1
            }
            res = max(res, distance)
        }
        return res
    }
}
