class Solution {
    func mctFromLeafValues(_ arr: [Int]) -> Int {
        var res = 0, arr = arr
        while arr.count > 1 {
            var min = Int.max, idx = -1
            let n = arr.count
            for i in 0..<n-1 {
                let cur = arr[i], nxt = arr[i + 1], val = cur * nxt
                if val < min {
                    min = val
                    idx = cur > nxt ? i + 1 : i
                }
            }
            res += min
            arr.remove(at: idx)
        }
        return res
    }
}