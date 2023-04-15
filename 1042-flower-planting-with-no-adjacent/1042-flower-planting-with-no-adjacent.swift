class Solution {
    func gardenNoAdj(_ n: Int, _ paths: [[Int]]) -> [Int] {
        var graph = [[Int]](repeating: [], count: n + 1)
        for path in paths {
            let garden0 = path[0], garden1 = path[1]
            graph[garden0].append(garden1)
            graph[garden1].append(garden0)
        }
        var res = [Int](repeating: 0, count: n)
        res[0] = 1
        for i in 1..<n {
            let neighbor = graph[i + 1]
            var flowers = 0
            for garden in neighbor where res[garden - 1] != 0 {
                flowers |= (1 << res[garden - 1])
            }
            for j in 1...4 {
                if flowers & (1 << j) == 0 {
                    res[i] = j
                    break
                }
            }
        }
        return res
    }
}