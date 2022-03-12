class Solution {
    func findFinalValue(_ nums: [Int], _ original: Int) -> Int {
        let set = Set(nums)
        var original = original
        while set.contains(original) {
            original <<= 1
        }
        return original
    }
}
