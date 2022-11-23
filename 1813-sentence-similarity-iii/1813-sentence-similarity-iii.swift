class Solution {
    func areSentencesSimilar(_ sentence1: String, _ sentence2: String) -> Bool {
        guard sentence1 != sentence2 else { return true }
        let words1 = sentence1.split(separator: " "),
            words2 = sentence2.split(separator: " ")
        var left = 0, right = 0
        while left < words1.count && left < words2.count && words1[left] == words2[left] {
            left += 1
        }
        let m = words1.count, n = words2.count
        if left == min(m, n) {
            return true
        }
        while right < words1.count && right < words2.count && words1[m - right - 1] == words2[n - right - 1] {
            right += 1
        }
        if right == min(m, n) {
            return true
        }
        return left + right == words1.count || left + right == words2.count
    }
}