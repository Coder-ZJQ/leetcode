class Solution {
    func checkDistances(_ s: String, _ distance: [Int]) -> Bool {
        var indexes = [Character: Int]()
        for (i, char) in s.enumerated() {
            if let pre = indexes[char] {
                if i - pre - 1 != distance[Int(char.asciiValue!) - 97] {
                    return false
                }
            } else {
                indexes[char] = i
            }
        }
        return true
    }
}