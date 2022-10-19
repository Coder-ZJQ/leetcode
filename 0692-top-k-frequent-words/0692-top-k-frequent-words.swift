class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var frequent = [String: Int]()
        for word in words {
            frequent[word] = frequent[word, default: 0] + 1
        }
        return frequent.sorted { cur, nxt in
            if cur.value == nxt.value {
                return cur.key < nxt.key
            }
            return cur.value > nxt.value
        }[..<k].map(\.key)
    }
}