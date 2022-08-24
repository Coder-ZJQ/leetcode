class Solution {
    func canBeEqual(_ target: [Int], _ arr: [Int]) -> Bool {
        for (a, b) in zip(target.sorted(), arr.sorted()) where a != b {
            return false
        }
        return true
    }
}
