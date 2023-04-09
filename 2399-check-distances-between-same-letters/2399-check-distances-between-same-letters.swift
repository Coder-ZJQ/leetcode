class Solution {
    func checkDistances(_ s: String, _ distance: [Int]) -> Bool {
        var indexes = [Int](repeating: -1, count: 26)
        for (i, char) in s.enumerated() {
            let char2index = Int(char.asciiValue!) - 97
            let preIndex = indexes[char2index]
            if preIndex >= 0 {
                if i - preIndex - 1 != distance[char2index] {
                    return false
                }
            } else {
                indexes[char2index] = i
            }
        }
        return true
    }
}