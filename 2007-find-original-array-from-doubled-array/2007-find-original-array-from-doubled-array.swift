class Solution {
    func findOriginalArray(_ changed: [Int]) -> [Int] {
        // 个数必须是偶数个
        guard changed.count % 2 == 0 else {
            return []
        }
        var freq = [Int: Int]()
        for num in changed {
            freq[num] = freq[num, default: 0] + 1
        }
        let nums = freq.keys.sorted()
        var res: [Int] = []
        for num in nums {
            let count = freq[num]!
            if count == 0 {
                continue
            }
            if num == 0 {
                if count % 2 != 0 {
                    return []
                }
                res += [Int](repeating: 0, count: count / 2)
                continue
            }
            let doubleNum = num * 2
            if let doubleCount = freq[doubleNum] {
                if doubleCount < count {
                    return []
                }
                freq[num * 2] = doubleCount - count
                freq[num] = 0
                res += [Int](repeating: num, count: count)
            } else {
                return []
            }
        }
        return res
    }
}