class Solution {
    /// arr 是从 1到 arr.count 的整数排列
    func pancakeSort(_ arr: [Int]) -> [Int] {
        var n = arr.count,
            arr = arr,
            res = [Int]()
        while n > 0 {
            for i in 0..<n {
                if arr[i] == n && i + 1 != n {
                    // 先移到最前面
                    if i > 0 {
                        reverse(&arr, i + 1)
                        res.append(i + 1)
                    }
                    // 再移到最后面
                    if n > 1 {
                        reverse(&arr, n)
                        res.append(n)
                    }
                    break
                }
            }
            n -= 1
        }
        return res
    }
    
    private func reverse(_ arr: inout [Int], _ k: Int) {
        var i = 0, j = k - 1
        while i < j {
            (arr[i], arr[j]) = (arr[j], arr[i])
            i += 1
            j -= 1
        }
    }
}