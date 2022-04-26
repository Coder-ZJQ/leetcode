class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let n = points.count
        var res = 0
        // 用以记录所有边的距离的二维数组
        var distanceArray = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        // 记录所有边的距离，
        for i in 0..<n {
            for j in i + 1..<n {
                let point1 = points[i],
                    point2 = points[j],
                    distance = abs(point1[0] - point2[0]) + abs(point1[1] - point2[1])
                // 节点i -> 节点j
                distanceArray[i][j] = distance
                // 节点j -> 节点i
                distanceArray[j][i] = distance
            }
        }
        
        // 用于记录节点是否已连接
        var connected = [0]
        var unconnect = [Bool](repeating: true, count: n)
        unconnect[0] = false
        
        while connected.count < n {
            var minIndex = -1
            var minDistance = Int.max
            for i in connected {
                for j in 0..<n where unconnect[j] {
                    let distance = distanceArray[i][j]
                    if distance < minDistance {
                        minIndex = j
                        minDistance = distance
                    }
                }
            }
            if minIndex > 0 {
                // 置为已连接
                unconnect[minIndex] = false
                connected.append(minIndex)
                // 追加距离
                res += minDistance
            }
        }
        
        return res
    }
}