class Solution {
    func secondHighest(_ s: String) -> Int {
        let nums = s.filter { char in
            char >= "0" && char <= "9"
        }
        let set = Set<Character>(nums)
        guard set.count > 1 else {
            return -1
        }
        return Int("\(set.sorted(by: >)[1])")!
    }
}