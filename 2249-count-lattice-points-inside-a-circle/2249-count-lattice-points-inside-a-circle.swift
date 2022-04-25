class Solution {
    func countLatticePoints(_ circles: [[Int]]) -> Int {
        var set = Set<String>()
        for circle in circles {
            let x = circle[0], y = circle[1], r = circle[2]
            let rr = r * r
            for i in -r...r {
                for j in -r...r where i * i + j * j <= rr {
                    set.insert("\(x + i),\(y + j)")
                }
            }
        }
        return set.count
    }
}
