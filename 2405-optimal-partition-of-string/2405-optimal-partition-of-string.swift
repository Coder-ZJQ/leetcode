class Solution {
    func partitionString(_ s: String) -> Int {
        var res = 1, set = Set<Character>()
        for char in s {
            if set.contains(char) {
                set = Set<Character>()
                res += 1
            }
            set.insert(char)
        }
        return res
    }
}