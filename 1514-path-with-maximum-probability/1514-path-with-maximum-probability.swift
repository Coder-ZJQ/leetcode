class Solution {
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
        var graph = [[(Int, Double)]](repeating: [], count: n)
        let m = edges.count
        for i in 0..<m {
            let edge = edges[i], prob = succProb[i], point0 = edge[0], point1 = edge[1]
            graph[point0].append((point1, prob))
            graph[point1].append((point0, prob))
        }
        var queue = [(start, 1.0)]
        var probs = [Double](repeating: 0.0, count: n)
        probs[start] = 1.0
        
        while !queue.isEmpty {
            let pair = queue.popLast()!, from = pair.0, prob = pair.1
            for (to, toProb) in graph[from] {
                let nextProb = prob * toProb
                if probs[to] < nextProb {
                    probs[to] = nextProb
                    queue.append((to, nextProb))
                }
            }
        }
        return probs[end]
    }
}