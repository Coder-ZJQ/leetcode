class Solution {
    func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {
        
        var heap = classes.filter({
            $0[0] != $0[1]
        }).sorted {
            let passi = $0[0],
                totali = $0[1],
                passj = $1[0],
                totalj = $1[1]
            
            return totali * (totali + 1) * (totalj - passj) > totalj * (totalj + 1) * (totali - passi)
        }
        guard !heap.isEmpty else {
            return 1.0
        }
        for _ in 0..<extraStudents {
            var last = heap.removeLast()
            let totali = last[1] + 1,
                passi = last[0] + 1
            
            var l = 0, r = heap.count - 1
            while l <= r {
                let mid = l + (r - l) >> 1
                let totalj = heap[mid][1],
                    passj = heap[mid][0]
                
                if totali * (totali + 1) * (totalj - passj) <= totalj * (totalj + 1) * (totali - passi) {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            heap.insert([passi, totali], at: l)
        }
        return (heap.reduce(0.0) { partialResult, cur in
            partialResult + Double(cur[0]) / Double(cur[1])
        } + Double(classes.count - heap.count)) / Double(classes.count)
    }
}