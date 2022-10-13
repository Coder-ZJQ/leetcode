class Solution {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        var end = 0, res = 0
        for i in 0..<arr.count {
            end = max(end, arr[i])
            if end == i {
                res += 1
            }
        }
        return res
    }
}