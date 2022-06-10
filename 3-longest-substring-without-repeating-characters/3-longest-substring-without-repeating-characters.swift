class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        var dict: [Character: Int] = [:]
        var j = 0, result = 1
        for (i, char) in s.enumerated() {
            if let index = dict[char] {
                j = max(j, index + 1)
            }
            dict[char] = i
            result = max(result, i - j + 1)
        }
        return result
    }
}