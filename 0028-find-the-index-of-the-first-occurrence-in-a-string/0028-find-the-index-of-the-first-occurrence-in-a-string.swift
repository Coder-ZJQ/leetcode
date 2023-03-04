class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let haystackChars = [Character](haystack),
            needleChars = [Character](needle)
        let m = haystackChars.count,
            n = needleChars.count
        for i in 0..<m {
            var j = 0
            while j < n && i + j < m && needleChars[j] == haystackChars[i + j] {
                j += 1
            }
            if j == n {
               return i
            }
        }
        return -1
    }
}