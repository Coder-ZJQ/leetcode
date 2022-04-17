class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        let bannedSet = Set(banned)
        let words = String(paragraph.map {
            if $0 == "!" || $0 == "?" || $0 == "'" || $0 == "," || $0 == ";" || $0 == "." {
                return " "
            }
            return $0
        }).split(separator: " ").map {
            $0.lowercased()
        }
        
        var dict = [String: Int]()
        var maxCount = 0, res: String = ""
        for word in words where !bannedSet.contains(word) {
            dict[word] = dict[word, default: 0] + 1
            let count = dict[word]!
            if count > maxCount {
                res = word
                maxCount = count
            }
        }
        return res
    }
}