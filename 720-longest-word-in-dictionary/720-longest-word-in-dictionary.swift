class Solution {
    func longestWord(_ words: [String]) -> String {
        var set = Set<String>()
        var res = ""
        for word in words.sorted() {
            if word.count == 1 || set.contains(String(word.prefix(word.count - 1))) {
                set.insert(word)
                if word.count > res.count {
                    res = word
                }
            }
        }
        return res
    }
}
