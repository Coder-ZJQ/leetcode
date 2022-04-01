class Solution {
    func canReorderDoubled(_ arr: [Int]) -> Bool {
        var dict = [Int: Int]()
        for num in arr {
            dict[num] = dict[num, default: 0] + 1
        }
        let keys = dict.keys.sorted()
        for key in keys {
            let value = dict[key]!
            guard value >= 0 else {
                return false
            }
            if value == 0 {
                continue
            }
            if key > 0 {
                guard let _ = dict[key * 2] else {
                    return false
                }
                dict[key * 2]! -= value
            } else if key < 0 {
                guard key % 2 == 0, let _ = dict[key / 2] else {
                    return false
                }
                dict[key / 2]! -= value
            } else {
                if value % 2 == 1 {
                    return false
                }
            }
            dict[key] = 0
        }
        return true
    }
}