class Solution {
    
    private var queue = [(distance: Int, row: Int, col: Int)]()
    
    private func enqueue(_ distance: Int,_ row: Int,_ col: Int) {
        var left = 0, right = queue.count - 1
        while left <= right {
            let mid = left + (right - left) >> 1
            if distance < queue[mid].distance {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        queue.insert((distance, row, col), at: left)
    }
    
    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        let m = heights.count, n = heights[0].count
        
        let directions = [0, 1, 0, -1, 0]
        var distances = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: m)
        queue.append((0, 0, 0))
        
        while let last = queue.popLast() {
            let distance = last.distance,
                row = last.row,
                col = last.col
            guard distance <= distances[row][col] else { continue }
            if row == m - 1 && col == n - 1 { return distance }
            
            for i in 1...4 {
                let r = row + directions[i],
                    c = col + directions[i - 1]
                guard r >= 0 && r < m && c >= 0 && c < n else { continue }
                let newDistance = max(distance, abs(heights[row][col] - heights[r][c]))
                if distances[r][c] > newDistance {
                    distances[r][c] = newDistance
                    enqueue(newDistance, r, c)
                }
            }
        }
        
        return 0
    }
}