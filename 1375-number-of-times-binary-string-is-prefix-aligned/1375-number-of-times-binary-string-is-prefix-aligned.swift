class Solution {
    func numTimesAllBlue(_ flips: [Int]) -> Int {
        var res = 0, maxVal = 0
        let n = flips.count
        for i in 0..<n {
            maxVal = max(maxVal, flips[i])
            if maxVal == i + 1 {
                res += 1
            }
        }
        return res
    }
}
