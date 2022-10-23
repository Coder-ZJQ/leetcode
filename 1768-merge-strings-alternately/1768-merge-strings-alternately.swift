class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var chars = [Character]()
        for (char1, char2) in zip(word1, word2) {
            chars.append(char1)
            chars.append(char2)
        }
        var res = String(chars)
        if word1.count > word2.count {
            res += word1[word1.index(word1.startIndex, offsetBy: word2.count)...]
        } else if word1.count < word2.count {
            res += word2[word2.index(word2.startIndex, offsetBy: word1.count)...]
        }
        return res
    }
}