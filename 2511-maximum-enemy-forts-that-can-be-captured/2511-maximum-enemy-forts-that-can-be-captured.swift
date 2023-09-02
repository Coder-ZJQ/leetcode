class Solution {
    func captureForts(_ forts: [Int]) -> Int {
        let n = forts.count
        var res = 0, preIndex: Int?
        for (i, fort) in forts.enumerated() {
            if fort == 1 || fort == -1 {
                if let index = preIndex, forts[index] != fort {
                    res = max(res, i - index - 1)
                }
                preIndex = i
            }
        }
        return res
    }
}
