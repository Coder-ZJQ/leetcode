class Solution {
    func partitionString(_ s: String) -> Int {
        var res = 1, bools = [Bool](repeating: false, count: 26)
        for char in s {
            let index = Int(char.asciiValue!) - 97
            if bools[index] {
                bools = [Bool](repeating: false, count: 26)
                res += 1
            }
            bools[index] = true
        }
        return res
    }
}