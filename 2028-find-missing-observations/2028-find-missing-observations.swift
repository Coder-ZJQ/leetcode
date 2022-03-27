class Solution {
    func missingRolls(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
        let m = rolls.count
        var missing = (m + n) * mean - rolls.reduce(0, +)
        guard missing >= n && missing <= n * 6 else {
            return []
        }
        var res = [Int](repeating: 1, count: n), i = 0
        missing -= n
        while missing > 0 && i < n {
            if missing >= 5 {
                res[i] += 5
                missing -= 5
            } else {
                res[i] += missing
                missing = 0
            }
            i += 1
        }
        return res
    }
}
