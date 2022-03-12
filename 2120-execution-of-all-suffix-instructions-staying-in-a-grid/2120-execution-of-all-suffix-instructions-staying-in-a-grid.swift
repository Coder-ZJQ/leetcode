class Solution {
    func executeInstructions(_ n: Int, _ startPos: [Int], _ s: String) -> [Int] {
        let steps = [Character](s),
            m = steps.count
        return (0..<m).map { index in
            var count = 0
            var start = startPos
            for i in index..<m {
                let step = steps[i]
                start[0] += step == "U" ? -1 : (step == "D" ? 1 : 0)
                let v = start[0]
                if v < 0 || v >= n {
                    return count
                }
                start[1] += step == "L" ? -1 : (step == "R" ? 1 : 0)
                let h = start[1]
                if h < 0 || h >= n {
                    return count
                }
                count += 1
            }
            return count
        }
    }
}