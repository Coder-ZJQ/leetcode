class Solution {
    func minimumRounds(_ tasks: [Int]) -> Int {
        var dict = [Int: Int]()
        for task in tasks {
            dict[task] = dict[task, default: 0] + 1
        }
        var res = 0
        for (_, count) in dict {
            let mod = count % 3
            if mod == 0 {
                res += count / 3
            } else if mod == 1 {
                if count / 3 > 0 {
                    res += count / 3 + 1
                } else {
                    return -1
                }
            } else {
                res += count / 3 + 1
            }
        }
        return res
    }
}
