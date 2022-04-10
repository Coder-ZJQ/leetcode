class Solution {
    func calPoints(_ ops: [String]) -> Int {
        var res = 0, arr = [Int]()
        for op in ops {
            if op == "+" {
                let n = arr.count
                let point = arr[n - 1] + arr[n - 2]
                arr.append(point)
                res += point
            } else if op == "D" {
                let n = arr.count
                let point = arr[n - 1] * 2
                arr.append(point)
                res += point
            } else if op == "C" {
                res -= arr.removeLast()
            } else {
                let point = Int(op) ?? 0
                arr.append(point)
                res += point
            }
        }
        return res
    }
}
