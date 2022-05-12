class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        let m = strs.count, n = strs[0].count
        guard m > 1 else { return 0 }
        var res = 0
        let charArray = strs.map {
            [Character]($0)
        }
        for col in 0..<n {
            for row in 1..<m {
                if charArray[row][col] < charArray[row - 1][col] {
                    res += 1
                    break
                }
            }
        }
        return res
    }
}
