class Solution {
    func findingUsersActiveMinutes(_ logs: [[Int]], _ k: Int) -> [Int] {
        var dict: [Int: Set<Int>] = [:]
        for log in logs {
            if dict[log[0]] != nil {
                dict[log[0]]!.insert(log[1])
            } else {
                dict[log[0]] = Set([log[1]])
            }
        }
        var res = [Int](repeating: 0, count: k)
        for v in dict.values {
            res[v.count - 1] += 1
        }
        return res
    }
}
